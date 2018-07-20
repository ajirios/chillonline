/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedbacklist;

/**
 *
 * @author El Jefe
 */
public class FeedbackTest 

{
    public FeedbackTest()
            
    {
        long clientID = Long.parseLong("2092788278287");
        long postID = Long.parseLong("43572556721");
        Feedback feedback1 = new Feedback(clientID, postID, "First comment in the series.");
        
        System.out.println("client: " + feedback1.getClientID() + "\tpost :" + feedback1.getPostID() + "\tfeedback: " + feedback1.getFeedbackID() + "\t" + feedback1.getFeedbackReport());
        
    }
}
