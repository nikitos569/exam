import net.proteanit.sql.DbUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BBS
{
    private JTable table1;
    public JPanel panel1;
    private JButton zeitraum;
    private JButton umsatzsummenButton;
    private JButton offenePostenButton;
    private JButton miettageUmsatzButton;
    private static final String user = "root";
    private static final String password = "bbs";
    private static String url = "jdbc:mysql://localhost:3306/baumaschinen_malgin";
    private static Connection con;
    private static Statement stmt;
    private static ResultSet rs;
    String query = new String();
    String selectedtext;
    ArrayList<String> rownames = new ArrayList<String>();
    ArrayList<String> tables = new ArrayList<String>();

    public BBS()
    {
        zeitraum.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                try
                {
                    query = "select AuftrDat, Mietbeginn, Mietende, MaschinenNr, Name, bezahlt from tbl_kunden k, tbl_auftrag a, tbl_rechnung r where k.KdNr = a.KdNr and a.AuftrNr = r.AuftrNr and Mietbeginn between '2013-04-11' and '2013-04-15' and bezahlt = 1";
                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(query);
                    table1.setModel(DbUtils.resultSetToTableModel(rs));
                } catch (Exception ex)
                {
                    JOptionPane.showMessageDialog(null, ex.toString());
                }
            }
        });
        umsatzsummenButton.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                try
                {
                    query = "select Name, sum(Betrag) as Umsatz from tbl_kunden k, tbl_auftrag a, tbl_rechnung r where k.KdNr = a.KdNr and a.AuftrNr = r.AuftrNr and bezahlt = 1 group by Name order by Name";
                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(query);
                    table1.setModel(DbUtils.resultSetToTableModel(rs));
                } catch (Exception ex)
                {
                    JOptionPane.showMessageDialog(null, ex.toString());
                }
            }
        });
        offenePostenButton.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                try
                {
                    query = "select Name, count(RechNr) as 'Offene Posten' from tbl_kunden k, tbl_auftrag a, tbl_rechnung r where k.KdNr  = a.KdNr and a.AuftrNr = r.AuftrNr and bezahlt = 0 group by Name order by Name";
                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(query);
                    table1.setModel(DbUtils.resultSetToTableModel(rs));
                } catch (Exception ex)
                {
                    JOptionPane.showMessageDialog(null, ex.toString());
                }
            }
        });
        miettageUmsatzButton.addActionListener(new ActionListener()
        {
            @Override
            public void actionPerformed(ActionEvent e)
            {
                try
                {
                    query = "select Bezeichnung, (Mietende - Mietbeginn) as 'Miettage', (Mietpreis * (Mietende - Mietbeginn)) as Umsatzmaschinen from tbl_maschinen m, tbl_auftrag a where a.MaschinenNr = m.MaschinenNr";
                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(query);
                    table1.setModel(DbUtils.resultSetToTableModel(rs));
                } catch (Exception ex)
                {
                    JOptionPane.showMessageDialog(null, ex.toString());
                }
            }
        });
    }

    public JPanel getPanel1()
    {
        return panel1;
    }


}


