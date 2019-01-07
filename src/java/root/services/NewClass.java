/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author yudafatah
 */
public class NewClass {

    public static void main(String[] args) {
        LeaveRequestServices lrs = new LeaveRequestServices();
//        ArrayList<String> getalllist = lrs.getLRListRelation("2");
        ArrayList<HashMap<String, String>> getalllist1 = lrs.getLRById("1");
        for (int i = 0; i < getalllist1.size(); i++) {
            System.out.println(getalllist1.get(i).get("noteRequest"));
            //System.out.println(getalllist.get(i).get("lrId") + " : " + getalllist1.get(i).get("empname") + " - " + getalllist.get(i).get("requestStatus"));
        }
//        System.out.println(getalllist.get(28));
//        LeaveRequestServices lrs = new LeaveRequestServices();
//        ArrayList<HashMap<String, String>> hm = lrs.getLRListRelation("2");
//        for (int i = 0; i < hm.size(); i++) {
//            System.out.println(hm.get(i).get("empname"));
//        }
    }
}
