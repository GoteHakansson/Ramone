#include <iostream>
#include "../include/emulator.hpp"
#include "../../libSocketCan/include/socketcan.hpp"
#include <thread>

bool Emulator::setgearPosition(gearPosition_t currentGearPos)
{
    gearPosition = currentGearPos;
    return true;
}

gearPosition_t Emulator::getGearPosition()
{
    return gearPosition;
}

bool Emulator::setGaspedalPostion(int gaspdedalPos)
{
    bool success = false;

    if (gaspdedalPos >= 0 && gaspdedalPos <= 100)
    {
        gasPedalPosition = gaspdedalPos;
        success = true;
    }
    else
    {
        success = false;
    }

    return success;
}
int Emulator::getGaspedalPositon()
{
    return gasPedalPosition;
}

int Emulator::getEngineRPM()
{
    return engineRPM;
}

bool Emulator::ignitionOn()
{
    if (ignition == ON)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool Emulator::setEngineRPM(int RPMValue)
{
    bool success = false;
    if (RPMValue >= 0 && RPMValue <= 5000)
    {
        engineRPM = RPMValue;
        success = true;
    }
    else
    {
        success = false;
    }
    return success;
}

void Emulator::updateRpm()
{
    const std::lock_guard<std::mutex> lock(mu);
    float rate = (MAX_SPD * gasPedalPosition) / 100;

    if (engineRPM < rate)
    {
        engineRPM += rate / 100;
    }
    else if (engineRPM > rate)
    {
        engineRPM -= rate / 100;
    }
    outputRpm();
}

void Emulator::outputRpm()
{
    std::cout << engineRPM << std::endl;
}

void Emulator::canReader()
{
    scpp::SocketCan sockat_can;

    if (sockat_can.open("vcan0") != scpp::STATUS_OK)
    {
        std::cout << "Cannot open vcan0." << std::endl;
        std::cout << "Check whether the vcan0 interface is up!" << std::endl;
        exit(-1);
    }

    while (ignitionOn())
    {
        scpp::CanFrame fr;
        if (sockat_can.read(fr) == scpp::STATUS_OK)
        {
            printf("len %d byte, id: %d, data: %02x %02x %02x \n", fr.len, fr.id,
                   fr.data[0], fr.data[1], fr.data[2]);
            const std::lock_guard<std::mutex> lock(mu);
            this->gasPedalPosition = int(fr.data[0]);
            this->gearPosition = gearPosition_t(fr.data[1]);
            this->ignition = ignition_t(fr.data[2]);
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
    }
}

void Emulator::canSender()
{
    scpp::SocketCan sockat_can1;
    if (sockat_can1.open("vcan1") != scpp::STATUS_OK)
    {
        std::cout << "Cannot open vcan1." << std::endl;
        std::cout << "Check whether the vcan1 interface is up!" << std::endl;
        exit(-1);
    }
    int a[3];
    const std::lock_guard<std::mutex> lock(mu);
    a[0] = int(engineRPM) / 256;
    a[1] = int(engineRPM) % 256;
    a[2] = 0;
    sockat_can1.send(a, 3);
}

void Emulator::calculateTorque()
{
    float maxEngineTorque;
    // if (engineRPM > 1000 && engineRPM <= 2020){
    if (engineRPM <= 2020)
    {
        maxEngineTorque = 0.0755 * engineRPM + 228, 5;
    }
    else if (engineRPM > 2020 && engineRPM <= 2990)
    {
        maxEngineTorque = 0.0557 * engineRPM + 272, 5;
    }
    else if (engineRPM > 2990 && engineRPM <= 3500)
    {
        maxEngineTorque = 0.0216 * engineRPM + 374, 4;
    }
    else if (engineRPM > 3500 && engineRPM <= 5000)
    {
        maxEngineTorque = 450;
    }
    else if (engineRPM > 5000)
    { // 6500){
        maxEngineTorque = (-0.0553 * engineRPM) + 726, 5;
    }
    engineTorque = maxEngineTorque * gasPedalPosition / 100;
}
float Emulator::tractionForce()
{
    if (gearPosition == D || gearPosition == R)
    {
        return engineTorque * gearRatios[gearIndex] * finalDriveRatio * drivelineEfficiency / dynamicWheelRadius;
    }
    else
    {
        return 0;
    }
}
float Emulator::aerodynamicForce()
{
    return airDensity * dragCoefficient * vehicleFrontalArea * vehicleSpeed * vehicleSpeed / 2;
}

float Emulator::vehicleAcceleration()
{
    float force = tractionForce();
    float brkForce = 0;
    if (gasPedalPosition == 0)
    {
        brkForce = engineBreakForce;
    }

    float sumForce = force - roadLoadForce - aerodynamicForce() - brkForce;
    if (vehicleSpeed <= 0)
    {
        sumForce = force;
    }
    if ((gasPedalPosition == 0) && ((engineRPM < 1050) && (engineRPM > 950)))
    {
        sumForce = 0;
    }

    return sumForce / vehicleMass;
}

void Emulator::setVehicleSpeed() // set vehicle current speed
{
    float dV = dT * vehicleAcceleration();
    vehicleAcc = vehicleAcceleration();
    vehicleSpeed += dV;
}

void Emulator::shiftScheduler()
{
    if (gearPosition == D)
    {
        if (engineRPM >= 5000 && gearIndex < 7)
        {
            gearIndex = gearIndex + 1;
        }
        else if (engineRPM <= 3000 && gearIndex > 0)
        {
            gearIndex = gearIndex - 1;
        }
    }
}

float Emulator::engineRPMChangeInNeutral()
{
    float engineRPMChange;
    if (gasPedalPosition == 0)
    {
        engineRPMChange = -8 * neutralRatio;
    }
    else
    {
        if (engineRPM <= 2020)
        {
            engineRPMChange = 20.4 * neutralRatio * gasPedalPosition / 100;
        }
        else if (engineRPM > 2020 && engineRPM <= 2990)
        {
            engineRPMChange = 23.8 * neutralRatio * gasPedalPosition / 100;
        }
        else if (engineRPM > 2990 && engineRPM <= 3500)
        {
            engineRPMChange = 26.1 * neutralRatio * gasPedalPosition / 100;
        }
        else if (engineRPM > 3500 && engineRPM <= 5000)
        {
            engineRPMChange = 26.4 * neutralRatio * gasPedalPosition / 100;
        }
        else if (engineRPM > 5000)
        { // 6500){
            engineRPMChange = 24.1 * neutralRatio * gasPedalPosition / 100;
        }
    }
    return engineRPMChange;
}

void Emulator::calculateEngineRPM()
{
    if (gearPosition == D || gearPosition == R)
    {
        this->engineRPM = 30 * vehicleSpeed / dynamicWheelRadius * gearRatios[gearIndex] * finalDriveRatio / 3.14;
    }
    else
    {
        this->engineRPM += engineRPMChangeInNeutral();
    }
    if (engineRPM < engineIdlingRPM - 75)
    {
        this->engineRPM = engineIdlingRPM;
    }
    else if (engineRPM > engineMaxRPM)
    {
        this->engineRPM = engineMaxRPM - 750;
    }
}

void Emulator::run()
{
    calculateTorque();
    vehicleAcceleration();
    setVehicleSpeed();
    calculateEngineRPM();
    shiftScheduler();
    std::cout << "acc%: " << gasPedalPosition << ", Acceleration: " << vehicleAcc << ", gear index: " << gearIndex << ", engine RPM: " << engineRPM << ", vehicle speed: " << vehicleSpeed << std::endl;
}