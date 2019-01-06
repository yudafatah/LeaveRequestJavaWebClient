/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.helper;

import javax.servlet.http.Part;

/**
 *
 * @author yudafatah
 */
public class extractFileName {
    public static String extract(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if(item.trim().startsWith("filename")){
                return item.substring(item.indexOf("=")+2,item.length()-1);
            }
        }
        return "fail extract";
    }
}
