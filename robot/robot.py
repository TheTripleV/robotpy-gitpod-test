#! python3


import wpilib
from wpilib.drive import DifferentialDrive
import networktables

from remote_shell import Remoteshell


class Robot(wpilib.TimedRobot):
    def robotInit(self):
        self.remote_shell = Remoteshell(self)

        self.left_motor = wpilib.Spark(0)
        self.right_motor = wpilib.Spark(1)

        self.drive = DifferentialDrive(self.left_motor, self.right_motor)

        self.stick = wpilib.Joystick(0)

    def teleopPeriodic(self) -> None:
        self.drive.arcadeDrive(self.stick.getY() * -1, self.stick.getX())

if __name__ == "__main__":
    wpilib.run(Robot)
