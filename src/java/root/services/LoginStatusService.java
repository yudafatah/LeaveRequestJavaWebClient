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
public class LoginStatusService {
    public String getLoginStatus(String email, String password){
        String result ="";
        try {
            String webService = "http://localhost:8383/acc/account/"+email+"/"+password+"/";
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
                // put br data to output
                while ((output = br.readLine()) != null) {
                    //System.out.println(output);
                    // make output become json object
                    JSONObject jSONObject = new JSONObject(output);
                    // get string from json object which has name status then check the status value
                    if(jSONObject.getString("status").contains("success")){
                        result = jSONObject.getString("data");
                    }
                    else{
                        System.out.println("Failed to load data from server");
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
}
