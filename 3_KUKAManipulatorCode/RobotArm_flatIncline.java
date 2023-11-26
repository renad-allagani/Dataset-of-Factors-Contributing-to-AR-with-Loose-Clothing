package SensorTest;

import com.kuka.roboticsAPI.applicationModel.RoboticsAPIApplication;
import static com.kuka.roboticsAPI.motionModel.BasicMotions.*;

import com.kuka.roboticsAPI.deviceModel.LBR;
import com.kuka.roboticsAPI.deviceModel.LBRE1Redundancy;
import com.kuka.roboticsAPI.geometricModel.Frame;
import com.kuka.roboticsAPI.motionModel.LIN;
import com.kuka.roboticsAPI.motionModel.PTP;
import com.kuka.roboticsAPI.motionModel.Spline;
import com.kuka.roboticsAPI.uiModel.ApplicationDialogType;
import com.kuka.common.ThreadUtil;
import com.kuka.roboticsAPI.motionModel.CIRC;

public class TwoSquare1 extends RoboticsAPIApplication {
	private LBR lbr;

	final static double radiusOfCircMove=120;
	final static int nullSpaceAngle = 80;

	final static double offsetAxis2And4=Math.toRadians(20);
	final static double offsetAxis4And6=Math.toRadians(-40);
	double[] loopCenterPosition= new double[]{
			0, offsetAxis2And4, 0, offsetAxis2And4 +offsetAxis4And6 -Math.toRadians(90), 0, offsetAxis4And6,Math.toRadians(90)};
	
	private final static String informationText=
			"This application is intended for floor mounted robots!"+ "\n" +
			"\n" +
			"The robot moves to the start position and based on this position, a motion that " +
			"describes the symbol of lemniscate (a 'horizontal eight') will be executed." + "\n" +
			"In a next step the robot will move in nullspace by "+nullSpaceAngle+"锟�in both directions.";

	public void initialize() {		
		lbr = getContext().getDeviceFromType(LBR.class);
	}

	public void run() {		
		getLogger().info("Show modal dialog and wait for user to confirm");
        int isCancel = getApplicationUI().displayModalDialog(ApplicationDialogType.QUESTION, informationText, "OK", "Cancel");
        if (isCancel == 1)
        {
            return;
        }

		getLogger().info("Move to start position of the lemniscate motion");	
		PTP ptpToLoopCenter = ptp(0, Math.toRadians(33), 0, -Math.toRadians(90), 0, -Math.toRadians(33), Math.toRadians(90));
	//	PTP ptpToLoopCenter = ptp(0, Math.toRadians(13), 0, -Math.toRadians(89), 0, -Math.toRadians(15), Math.toRadians(90));
		ptpToLoopCenter.setJointVelocityRel(0.25);
		lbr.move(ptpToLoopCenter);
		
		////////////////////////////////////////////////////////////////////////// added code
		
		double distance = 100; // Distance in mm
        double angleInDegrees = 0; //45
        double angleInRadians = Math.toRadians(angleInDegrees);

		double targetX = distance * Math.cos(angleInRadians);
        double targetY = -distance * Math.sin(angleInRadians);
		
        //High Frequency 
        //lbr.move(linRel(-targetX, -targetY, 0).setCartVelocity(300)); //adjust start position
        //ThreadUtil.milliSleep(2000);//start recording 
        //lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(300));
        //lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(300));
        //ThreadUtil.milliSleep(1000);
        //lbr.move(linRel(targetX, targetY, 0).setCartVelocity(300)); //go back to start position
        
        //Low Frequency 
        lbr.move(linRel(-targetX, -targetY, 0).setCartVelocity(150)); //adjust start position
        ThreadUtil.milliSleep(2000);//start recording 
        lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(150));
        lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(150));
        lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(150));
        lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(150));
        lbr.move(linRel(2*targetX, 2*targetY, 0).setCartVelocity(150));
        lbr.move(linRel(-2*targetX, -2*targetY, 0).setCartVelocity(150));
        ThreadUtil.milliSleep(1000);
        lbr.move(linRel(targetX, targetY, 0).setCartVelocity(150)); //go back to start position
        
        //High Frequency (z-axis)
        //lbr.move(linRel(0, -targetY, -targetX).setCartVelocity(300)); //adjust start position
        //ThreadUtil.milliSleep(2000);//start recording 
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(300));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(300));
        //ThreadUtil.milliSleep(1000);
        //lbr.move(linRel(0, targetY, targetX).setCartVelocity(300)); //go back to start position
        
        //Low Frequency (z-axis)
        //lbr.move(linRel(0, -targetY, -targetX).setCartVelocity(150)); //adjust start position
        //ThreadUtil.milliSleep(2000);//start recording 
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(150));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(150));
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(150));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(150));
        //lbr.move(linRel(0, 2*targetY, 2*targetX).setCartVelocity(150));
        //lbr.move(linRel(0, -2*targetY, -2*targetX).setCartVelocity(150));
        //ThreadUtil.milliSleep(1000);
        //lbr.move(linRel(0, targetY, targetX).setCartVelocity(300)); //go back to start position

        /////////////////////////////////////////////////////////////////////////  end of added code  
	}

	private Spline createLemniscateSpline(Frame centerFrame) {

		// Create a new frame with the center frame as parent. Set an offset for the x axis to this parent.
		Frame rightFrame=(new Frame(centerFrame)).setX(2*0);

		// Create a new frame with the center frame as parent. Set an offset for the x axis to this parent.
		Frame leftFrame= (new Frame(centerFrame)).setX(-2*radiusOfCircMove);	

		// Create a new frame with the center frame as parent. Set an offset for the x and y axes to this parent.
		Frame topLeftFrame= (new Frame(centerFrame)).setX(0).setZ(+0);	

		// Create a new frame with the center frame as parent. Set an offset for the x and y axes to this parent.
		Frame topRightFrame= (new Frame(centerFrame)).setX(+0).setY(0);		

		// Create a new frame with the center frame as parent. Set an offset for the x and y axes to this parent.
		Frame bottomRightFrame= (new Frame(centerFrame)).setX(+0).setY(-0);

		// Create a new frame with the center frame as parent. Set an offset for the x and y axes to this parent.
		Frame bottomLeftFrame= (new Frame(centerFrame)).setX(-radiusOfCircMove).setZ(+radiusOfCircMove);

		// Create a spline that describes a lemniscate
		Spline spline = new Spline(
				spl(bottomLeftFrame),
				spl(leftFrame),
				spl(leftFrame),
				spl(leftFrame),
				spl(leftFrame),
				spl(leftFrame),
				spl(leftFrame),
				spl(leftFrame));
		return spline;
	}

	private Frame createChildFrameAndSetE1Offset( Frame parent, double offset) {

		// Create a new frame
		Frame childFrame = new Frame(parent);

		// Create new redundancy information
		LBRE1Redundancy newRedundancyInformation = new LBRE1Redundancy().setE1(offset);

		// Add new redundancy information to new frame
		childFrame.setRedundancyInformation(lbr, newRedundancyInformation);
		return childFrame;
	}
}
