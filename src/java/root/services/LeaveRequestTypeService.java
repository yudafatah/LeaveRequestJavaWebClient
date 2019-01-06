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
public class LeaveRequestTypeService {
    public ArrayList<HashMap<String, String>> getAllLRT(){
        // hashmap for leave requests list
        ArrayList<HashMap<String, String>> lrList = new ArrayList<HashMap<String, String>>();
        try {
            String webService = "http://localhost:8383/lrt/leaverequesttypes";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");
            // if connected to server or request status ok
            if (connection.getResponseCode() == 200) {
                // get input or data from server
                BufferedReader br = new BufferedReader(new InputStreamReader((connection.getInputStream())));
                String output;
                //System.out.println("output : ");
                // take br data to output
                while ((output = br.readLine()) != null) {
                    //System.out.println(output);
                    // make output become json object
                    JSONObject jSONObject = new JSONObject(output);
                    // get string from json object which has name status then check the status value
                    if(jSONObject.getString("status").contains("success")){
                        // get json array from json object which has name data
                        JSONArray dataArr = jSONObject.getJSONArray("data");
                        //System.out.println("data Object output : ");
                        //System.out.println(dataArr);
                        // looping the array to get array values each index
                        for(int i = 0; i < dataArr.length();i++){
                            // make an index values become an object
                            JSONObject dataObj = dataArr.getJSONObject(i);
                            // temporary hashmap for single leave request
                            HashMap<String, String> lr =  new HashMap<String, String>();
                            int typeLrId = dataObj.getInt("typeLrId");
                            String typeName = dataObj.getString("typeName");
                            int durationLimit = dataObj.getInt("durationLimit");
                            
                            lr.put("typeLrId", typeLrId+"");
                            lr.put("typeName", typeName);
                            lr.put("durationLimit", durationLimit+"");
                            
                            lrList.add(lr);
                        }
                        return lrList;
                    }
                    else{
                        System.out.println("Failed to load data from server");
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
