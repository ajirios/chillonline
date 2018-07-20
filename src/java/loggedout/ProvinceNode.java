/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;

/**
 *
 * @author El Jefe
 */
public class ProvinceNode 

{
    private Province province;
    private ProvinceNode nextNode;
    
    public ProvinceNode(Province province, ProvinceNode nextNode)
            
    {
        this.province = province;
        this.nextNode = nextNode;
    }

    public Province getProvince() 
    
    {
        return province;
    }

    public void setProvince(Province province) 
    
    {
        this.province = province;
    }

    public ProvinceNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(ProvinceNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
    
}
