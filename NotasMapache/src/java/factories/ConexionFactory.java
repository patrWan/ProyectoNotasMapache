/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package factories;

import dao.ConexionDAO;

public class ConexionFactory {
    private static ConexionFactory daoFactory;

    public ConexionFactory() {
        
    }
    
    public static ConexionFactory getInstance(){
        if(daoFactory == null){
            daoFactory = new ConexionFactory();
        }
        
        return daoFactory;
    }
    
    public enum Motor{
        MY_SQL, MS_SQL
    }
    
    public ConexionDAO getConexionDAO(Motor motor){
        switch(motor){
            
            case MY_SQL:
                return new MySQL_Conexion();
            default:
                return null;
        }
    }
}