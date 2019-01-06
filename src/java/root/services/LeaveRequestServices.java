/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.services;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author yudafatah
 */
public class LeaveRequestServices {

    /**
     * get all leave request list by user role and role
     *
     * @param role
     * @param id
     * @return leave request list by role and id
     */
    public ArrayList<HashMap<String, String>> getAllLR(String role, String id) {
        // hashmap for leave requests list
        ArrayList<HashMap<String, String>> lrList = new ArrayList<>();
        lrList.removeAll(lrList);
        try {
            String webService = "http://localhost:8383/lr/leaverequests/" + id;
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
                    if (jSONObject.getString("status").contains("success")) {
                        // get json array from json object which has name data
                        JSONArray dataArr = jSONObject.getJSONArray("data");
                        //System.out.println("data Object output : ");
                        //System.out.println(dataArr);
                        // looping the array to get array values each index
                        for (int i = 0; i < dataArr.length(); i++) {
                            // make an index values become an object
                            JSONObject dataObj = dataArr.getJSONObject(i);
                            // temporary hashmap for single leave request
                            HashMap<String, String> lr = new HashMap<>();
                            lr.put("lrId", dataObj.getString("lrId"));
                            lr.put("requestDate", dataObj.getString("requestDate"));
                            lr.put("startDate", dataObj.getString("startDate"));
                            lr.put("endDate", dataObj.getString("endDate"));
                            lr.put("lrDuration", dataObj.getString("lrDuration"));
                            lr.put("noteRequest", dataObj.getString("noteRequest"));
                            lr.put("requestStatus", dataObj.getString("requestStatus"));
                            lr.put("image", dataObj.getString("image"));
                            lr.put("noteReject", dataObj.get("noteReject").toString());
                            lr.put("empName", dataObj.getString("empName"));
                            lr.put("typeLr", dataObj.getString("typeLr"));

                            lrList.add(lr);
                        }
                        return lrList;
                    } else {
                        System.out.println("Failed to load data from server");
                    }
                }
            }
        } catch (IOException | JSONException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<HashMap<String, String>> getAllLRASManager(String id) {
        // hashmap for leave requests list
        ArrayList<HashMap<String, String>> lrList = new ArrayList<>();
        try {
            String webService = "http://localhost:8383/lr/leaverequestsmanager/" + id;
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
                    if (jSONObject.getString("status").contains("success")) {
                        // get json array from json object which has name data
                        JSONArray dataArr = jSONObject.getJSONArray("data");
                        //System.out.println("data Object output : ");
                        //System.out.println(dataArr);
                        // looping the array to get array values each index
                        for (int i = 0; i < dataArr.length(); i++) {
                            // make an index values become an object
                            JSONObject dataObj = dataArr.getJSONObject(i);
                            // temporary hashmap for single leave request
                            HashMap<String, String> lr = new HashMap<>();
                            int lrId = dataObj.getInt("lrId");
                            String requestDate = dataObj.get("requestDate").toString();
                            String startDate = dataObj.get("startDate").toString();
                            String endDate = dataObj.get("endDate").toString();
                            int lrDuration = dataObj.getInt("lrDuration");
                            String noteRequest = dataObj.getString("noteRequest");
                            String requestStatus = dataObj.getString("requestStatus");
                            String image = dataObj.get("image").toString();
                            String noteReject = dataObj.get("noteReject").toString();

                            lr.put("lrId", lrId + "");
                            lr.put("requestDate", requestDate);
                            lr.put("startDate", startDate);
                            lr.put("endDate", endDate);
                            lr.put("lrDuration", lrDuration + "");
                            lr.put("noteRequest", noteRequest);
                            lr.put("requestStatus", requestStatus);
                            lr.put("image", image);
                            lr.put("noteReject", noteReject);

                            lrList.add(lr);
                        }
                        return lrList;
                    } else {
                        System.out.println("Failed to load data from server");
                    }
                }
            }
        } catch (IOException | JSONException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<String> getLRListRelation(String id) {
        try {
            String webService = "http://localhost:8383/lr/leaverequestsrelation/" + id + "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");
            ArrayList<String> relationList = new ArrayList<>();
//            relationList.removeAll(relationList);
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
//                    HashMap<String, String> lr = new HashMap<>();
                    // make output become json object
                    JSONObject jSONObject = new JSONObject(output);
                    // get string from json object which has name status then check the status value
                    if (jSONObject.getString("status").contains("success")) {
                        JSONArray relation = jSONObject.getJSONArray("data");
                        //Object mm = jSONObject.get("data");
                        System.out.println(relation.length());
                        for (int i = 0; i < relation.length(); i++) {
                            String x = relation.getString(i);
//                            lr.put("empname", x);
                            relationList.add(x);
                            System.out.println(i + " " + relationList.get(i));

                        }
                        System.out.println(relationList.get(25));
                        return relationList;
//                        lr.put("empname", mm);
//                        relationList.add(lr);

                    } else {
                        System.out.println("Failed to load data from server");
                    }
                }

            }
        } catch (IOException | JSONException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<HashMap<String, String>> getLRById(String lrid) {
        try {
            String webService = "http://localhost:8383/lr/leaverequest/" + lrid + "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");
            ArrayList<HashMap<String, String>> lrList = new ArrayList<>();
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
                    HashMap<String, String> lr = new HashMap<>();
                    JSONObject jSONObject = new JSONObject(output);
                    lr.put("lrId", jSONObject.getInt("lrId")+"");
                    lr.put("requestDate", jSONObject.get("requestDate").toString());
                    lr.put("startDate", jSONObject.get("startDate").toString());
                    lr.put("endDate", jSONObject.get("endDate").toString());
                    lr.put("lrDuration", jSONObject.getInt("lrDuration")+"");
                    lr.put("noteRequest", jSONObject.getString("noteRequest"));
                    lr.put("requestStatus", jSONObject.getString("requestStatus"));
                    lr.put("image", jSONObject.get("image").toString());
                    lr.put("noteReject", jSONObject.getString("noteReject"));
                    lrList.add(lr);
                }
                return lrList;
            }
        } catch (IOException | JSONException e) {
            System.out.println(e);
        }
        return null;
    }

    public String updateLRApprove(String id) {
        try {
            String webService = "http://localhost:8383/lr/leaverequestapprove/" + id + "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() == 200) {
                return "Data has been edited";
            }
        } catch (IOException e) {
            System.out.println(e);
        }
        return null;
    }

    public String cancelLR(String id) {
        try {
            String webService = "http://localhost:8383/lr/leaverequestcancel/" + id + "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() == 200) {
                return "Data has been canceled";
            }
        } catch (IOException e) {
            System.out.println(e);
        }
        return null;
    }

    public String createLR(String id, String typelr, String startdate, String enddate, String notereq, String savepath) {
        try {
            String webService = "http://localhost:8383/lr/leaverequestcreate/" + id + "/" + typelr + "/" + startdate + "/" + enddate + "/" + notereq + "/" + savepath + "/";
            URL url = new URL(webService);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() == 200) {
                return "New data has been created";
            }
        } catch (IOException e) {
            System.out.println(e);
        }
        return null;
    }

}
