import package_bbs.BBS;

import javax.swing.*;
import java.awt.*;

public class Launcher
{
    public static void main(String[] args)
    {
        //ArrayList asking = new ArrayList();
        JFrame frame = new JFrame("App");
        frame.setContentPane(new BBS().getPanel1());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setPreferredSize(new Dimension(1200, 640));
        frame.setVisible(true);
    }
}
