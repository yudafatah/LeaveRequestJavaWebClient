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
public class EmployeeService {

    public ArrayList<HashMap<String, String>> getEmployeeByEmail(String email) {
        try {
            String webService = "http://localhost:8383/profile/employeebyemail/" + email + "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");
            ArrayList<HashMap<String, String>> employeeList = new ArrayList<HashMap<String, String>>();
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
                    HashMap<String, String> employee = new HashMap<String, String>();
                    JSONObject jSONObject = new JSONObject(output);
                    employee.put("employeeId", jSONObject.getInt("employeeId") + "");
                    employee.put("employeeName", jSONObject.getString("employeeName"));
                    employee.put("gender", jSONObject.getString("gender"));
                    employee.put("address", jSONObject.getString("address"));
                    employee.put("joinDate", jSONObject.get("joinDate").toString());
                    employee.put("email", jSONObject.getString("email"));
                    employee.put("username", jSONObject.getString("username"));
                    employee.put("quotaThisyear", jSONObject.getInt("quotaThisyear") + "");
                    employee.put("password", jSONObject.getString("password"));
                    String boole = "";
                    if(jSONObject.getBoolean("isActive")){
                        boole = "1";
                    }
                    else{
                        boole = "0";
                    }
                    employee.put("isActive", boole);
                    employee.put("phone", jSONObject.getString("phone"));
                    employee.put("quotaLastyear", jSONObject.getInt("quotaLastyear")+"");
                    employeeList.add(employee);
                }
                return employeeList;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<HashMap<String, String>> getEmployeeRelationByEmail(String email) {
        try {
            String webService = "http://localhost:8383/profile/employeerelationbyemail/" + email + "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");
            ArrayList<HashMap<String, String>> relationList = new ArrayList<HashMap<String, String>>();
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
                    HashMap<String, String> employee = new HashMap<String, String>();
                    // make output become json object
                    JSONObject jSONObject = new JSONObject(output);
                    // get string from json object which has name status then check the status value
                    if(jSONObject.getString("status").contains("success")){
                        JSONArray relation = jSONObject.getJSONArray("data");
                        employee.put("role", relation.get(0).toString());
                        employee.put("site", relation.get(1).toString());
                        relationList.add(employee);
                    }
                    else{
                        System.out.println("Failed to load data from server");
                    }
                }
                return relationList;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public String updateEmployee(String id, String name, String address, String phone) {
        try {
            String webService = "http://localhost:8383/profile/employee/" + id + "/"+ name+ "/"+address+"/"+phone;
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() == 200) {
                return "Data has been edited";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public String updateEmployeeActivation(String id, String password) {
        try {
            String webService = "http://localhost:8383/profile/employeeactivation/" + id + "/"+ password+ "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() == 200) {
                return "Data has been edited";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public String updateEmployeeLRQuota(String id, String lrduration) {
        try {
            String webService = "http://localhost:8383/profile/employeeupdatelrquota/" + id + "/"+ lrduration+ "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() == 200) {
                return "Data has been edited";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
}
