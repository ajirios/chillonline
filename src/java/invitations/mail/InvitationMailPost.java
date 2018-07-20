/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package invitations.mail;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author El Jefe
 */
public class InvitationMailPost 

{
    private String recipientFirstName;
    private String recipientLastName;
    private String recipientEmail;
    private String senderFirstName;
    private String senderClientName;
    private String boardName;
    private String boardHostName;
    private String boardAccessMode;
    private String gender;
    private String subject;
    private String teamName;
    private String organizationName;
    private int boardCount;
    private String imageURL;
    
    public InvitationMailPost(String recipientEmail, String recipientFirstName, String senderClientName, String boardName, String boardAccessMode, int boardCount, String teamName, String gender)
            
    {
        this.recipientFirstName = recipientFirstName;
        this.recipientLastName = null;
        this.recipientEmail = recipientEmail;
        this.senderFirstName = null;
        this.senderClientName = senderClientName;
        this.gender = gender;
        this.subject = "his";
        this.boardName = boardName;
        this.boardHostName = null;
        this.boardAccessMode = boardAccessMode;
        this.boardCount = boardCount;
        this.teamName = teamName;
        this.organizationName = null;
        //this.imageURL = "ci3.googleusercontent.com/proxy/kL4SKIuV7-3Qju-DBNF5YVKQ2qj8iVH3ALQsA0TjMezQiTNcbIltEyAEYXGMWwUyEM7hJqO39T5UEaDmkTz5wiRlKXmgKbd82ccSPM07uR83bxRsfEaL9u9IqeavcYs9kNaJZB7xd16hNvIGcBYmilFjooJXTeDQJR1jOgM=s0-d-e1-ft#https://gallery.mailchimp.com/d3b92af0b0c79bbe2e95f542c/images/f289bdda-4d41-489c-a944-a714bd729948.png";
        this.imageURL = "ci5.googleusercontent.com/proxy/8G_sUpBtJ_B5I4w99ozfUYmiFr-U7l8kbq8X5afr2PClYq3LpFPz4xPXNLdNJNC4qMSpgwVpaC6mtz4YNw9f-glJnnAJDivyY9K50cGCiWqPv6XjJohNtQUMkIh8_x9czxiM87jGvFrDqGawvtqQs9aoytMu3PLADesQKfw=s0-d-e1-ft#https://gallery.mailchimp.com/d3b92af0b0c79bbe2e95f542c/images/ea2995d9-537b-4039-a3ea-8b44a9bd6c2d.png";
        
        if (gender.equalsIgnoreCase("male"))
            
        {
            this.subject = "his";
        }
        
        else if (gender.equalsIgnoreCase("female"))
            
        {
            this.subject = "her";
        }
        
        constructInvitationMail();
        System.out.println("Sent.");
    }
    
    private void constructInvitationMail()
            
    {
        
        try
            
        {
            String host = "smtp.gmail.com";
            String username = "service@chilltechnologies.ca";
            String password = "Empire@621";
            String to = this.recipientEmail;
            String from = "service@chilltechnologies.ca";
            String subject = "Chillonline Course Sharing Invitation";
            String messageHTML = "<div id=\":14o\" class=\"ii gt adP adO\"><div id=\":14n\" class=\"a3s aXjCH m15e538a0519bbaab\"><u></u>\n" +
"\n" +
"	\n" +
"		\n" +
"		\n" +
"		\n" +
"        \n" +
"        \n" +
"		\n" +
"        \n" +
"    \n" +
"    <div style=\"height:100%;margin:0;padding:0;width:100%\">\n" +
"		\n" +
"        <center>\n" +
"            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"m_1364387473476751262bodyTable\" style=\"border-collapse:collapse;height:100%;margin:0;padding:0;width:100%\">\n" +
"                <tbody><tr>\n" +
"                    <td align=\"center\" valign=\"top\" id=\"m_1364387473476751262bodyCell\" style=\"height:100%;margin:0;padding:0;width:100%\">\n" +
"                        \n" +
"                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n" +
"							<tbody><tr>\n" +
"								<td align=\"center\" valign=\"top\" id=\"m_1364387473476751262templateHeader\" style=\"background:#f7f7f7 none no-repeat center/cover;background-color:#f7f7f7;background-image:none;background-repeat:no-repeat;background-position:center;background-size:cover;border-top:0;border-bottom:0;padding-top:54px;padding-bottom:54px\">\n" +
"									\n" +
"									<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262templateContainer\" style=\"border-collapse:collapse;max-width:600px!important\">\n" +
"										<tbody><tr>\n" +
"                                			<td valign=\"top\" class=\"m_1364387473476751262headerContainer\" style=\"background:transparent none no-repeat center/cover;background-color:transparent;background-image:none;background-repeat:no-repeat;background-position:center;background-size:cover;border-top:0;border-bottom:0;padding-top:0;padding-bottom:0\"></td>\n" +
"										</tr>\n" +
"									</tbody></table>\n" +
"									\n" +
"								</td>\n" +
"                            </tr>\n" +
"							<tr>\n" +
"								<td align=\"center\" valign=\"top\" id=\"m_1364387473476751262templateBody\" style=\"background:#ffffff none no-repeat center/cover;background-color:#ffffff;background-image:none;background-repeat:no-repeat;background-position:center;background-size:cover;border-top:0;border-bottom:0;padding-top:27px;padding-bottom:54px\">\n" +
"									\n" +
"									<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262templateContainer\" style=\"border-collapse:collapse;max-width:600px!important\">\n" +
"										<tbody><tr>\n" +
"                                			<td valign=\"top\" class=\"m_1364387473476751262bodyContainer\" style=\"background:transparent none no-repeat center/cover;background-color:transparent;background-image:none;background-repeat:no-repeat;background-position:center;background-size:cover;border-top:0;border-bottom:0;padding-top:0;padding-bottom:0\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnTextBlock\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    <tbody class=\"m_1364387473476751262mcnTextBlockOuter\">\n" +
"        <tr>\n" +
"            <td valign=\"top\" class=\"m_1364387473476751262mcnTextBlockInner\" style=\"padding-top:9px\">\n" +
"              	\n" +
"			    \n" +
"				\n" +
"                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%;min-width:100%;border-collapse:collapse\" width=\"100%\" class=\"m_1364387473476751262mcnTextContentContainer\">\n" +
"                    <tbody><tr>\n" +
"                        \n" +
"                        <td valign=\"top\" class=\"m_1364387473476751262mcnTextContent\" style=\"padding-top:0;padding-right:18px;padding-bottom:9px;padding-left:18px;word-break:break-word;color:#808080;font-family:Helvetica;font-size:16px;line-height:150%;text-align:left\">\n" +
"                        \n" +
"                            <h1 style=\"display:block;margin:0;padding:0;color:#222222;font-family:Helvetica;font-size:40px;font-style:normal;font-weight:bold;line-height:150%;letter-spacing:normal;text-align:center\">Hi " + recipientFirstName + ",</h1>\n" +
"\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"				\n" +
"                \n" +
"				\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnDividerBlock\" style=\"min-width:100%;border-collapse:collapse;table-layout:fixed!important\">\n" +
"    <tbody class=\"m_1364387473476751262mcnDividerBlockOuter\">\n" +
"        <tr>\n" +
"            <td class=\"m_1364387473476751262mcnDividerBlockInner\" style=\"min-width:100%;padding:18px 18px 0px\">\n" +
"                <table class=\"m_1364387473476751262mcnDividerContent\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"                    <tbody><tr>\n" +
"                        <td>\n" +
"                            <span></span>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnImageBlock\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    <tbody class=\"m_1364387473476751262mcnImageBlockOuter\">\n" +
"            <tr>\n" +
"                <td valign=\"top\" style=\"padding:9px\" class=\"m_1364387473476751262mcnImageBlockInner\">\n" +
"                    <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"m_1364387473476751262mcnImageContentContainer\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"                        <tbody><tr>\n" +
"                            <td class=\"m_1364387473476751262mcnImageContent\" valign=\"top\" style=\"padding-right:9px;padding-left:9px;padding-top:0;padding-bottom:0;text-align:center\">\n" +
"                                \n" +
"                                    \n" +
"                                        <img align=\"center\" alt=\"\" src=\"https://" + this.imageURL + "\" width=\"564.0000152587891\" style=\"max-width:1024px;padding-bottom:0;display:inline!important;vertical-align:bottom;border:0;height:auto;outline:none;text-decoration:none\" class=\"m_1364387473476751262mcnImage CToWUd a6T\" tabindex=\"0\"><div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 368.333px; top: 362.229px;\"><div id=\":150\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" title=\"Download\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\"><div class=\"aSK J-J5-Ji aYr\"></div></div></div>\n" +
"                                    \n" +
"                                \n" +
"                            </td>\n" +
"                        </tr>\n" +
"                    </tbody></table>\n" +
"                </td>\n" +
"            </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnTextBlock\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    <tbody class=\"m_1364387473476751262mcnTextBlockOuter\">\n" +
"        <tr>\n" +
"            <td valign=\"top\" class=\"m_1364387473476751262mcnTextBlockInner\" style=\"padding-top:9px\">\n" +
"              	\n" +
"			    \n" +
"				\n" +
"                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%;min-width:100%;border-collapse:collapse\" width=\"100%\" class=\"m_1364387473476751262mcnTextContentContainer\">\n" +
"                    <tbody><tr>\n" +
"                        \n" +
"                        <td valign=\"top\" class=\"m_1364387473476751262mcnTextContent\" style=\"padding-top:0;padding-right:18px;padding-bottom:9px;padding-left:18px;word-break:break-word;color:#808080;font-family:Helvetica;font-size:16px;line-height:150%;text-align:left\">\n" +
"                        \n" +
"                            <p style=\"margin:10px 0;padding:0;color:#808080;font-family:Helvetica;font-size:16px;line-height:150%;text-align:left\"><strong>Hi " + recipientFirstName + ",</strong><br>\n" +
"<br>\n" + this.senderClientName + " has invited you to join " + this.subject + "&nbsp;" + this.boardAccessMode + " course accessory board, \"" + this.boardName + ",\" on Chillonline website,&nbsp;<a href=\"https://chillonline.net\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=en&amp;q=https://chillonline.net&amp;source=gmail&amp;ust=1504727902326000&amp;usg=AFQjCNGi6uz469pIiKS2-ezEn31uwQKwLg\">https://chillonline.net</a>. Chillonline is currently only available on desktop computers.&nbsp;Mobile features are not yet complete at this time&nbsp;so, please&nbsp;bear with us. To join this board, register or sign in at&nbsp;<a href=\"https://chillonline.net\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=en&amp;q=https://chillonline.net&amp;source=gmail&amp;ust=1504727902326000&amp;usg=AFQjCNGi6uz469pIiKS2-ezEn31uwQKwLg\">https://chillonline.net</a> website on any&nbsp;desktop or laptop computer near you.&nbsp;Then, search for \"" + this.boardName + "\" when signed in.<br>" +
"<br>" +
"We appreciate your co-operation,<br>\n" +
"<br>\n" +
"Boarding Services,<br>\n" +
"Chill Technologies Inc.<br>\n" +
"<br>\n" +
"&nbsp;</p>\n" +
"\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"				\n" +
"                \n" +
"				\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnDividerBlock\" style=\"min-width:100%;border-collapse:collapse;table-layout:fixed!important\">\n" +
"    <tbody class=\"m_1364387473476751262mcnDividerBlockOuter\">\n" +
"        <tr>\n" +
"            <td class=\"m_1364387473476751262mcnDividerBlockInner\" style=\"min-width:100%;padding:9px 18px 0px\">\n" +
"                <table class=\"m_1364387473476751262mcnDividerContent\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"                    <tbody><tr>\n" +
"                        <td>\n" +
"                            <span></span>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnButtonBlock\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    <tbody class=\"m_1364387473476751262mcnButtonBlockOuter\">\n" +
"        <tr>\n" +
"            <td style=\"padding-top:0;padding-right:18px;padding-bottom:18px;padding-left:18px\" valign=\"top\" align=\"center\" class=\"m_1364387473476751262mcnButtonBlockInner\">\n" +
"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"m_1364387473476751262mcnButtonContentContainer\" style=\"border-collapse:separate!important;border-radius:3px;background-color:#ff4400\">\n" +
"                    <tbody>\n" +
"                        <tr>\n" +
"                            <td align=\"center\" valign=\"middle\" class=\"m_1364387473476751262mcnButtonContent\" style=\"font-family:Helvetica;font-size:18px;padding:18px\">\n" +
"                                <a class=\"m_1364387473476751262mcnButton\" title=\"Accept Invitation\" href=\"https://chillonline.net\" style=\"font-weight:bold;letter-spacing:-0.5px;line-height:100%;text-align:center;text-decoration:none;color:#ffffff;display:block\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=en&amp;q=https://chillonline.net&amp;source=gmail&amp;ust=1504727902326000&amp;usg=AFQjCNGi6uz469pIiKS2-ezEn31uwQKwLg\">Accept Invitation</a>\n" +
"                            </td>\n" +
"                        </tr>\n" +
"                    </tbody>\n" +
"                </table>\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnDividerBlock\" style=\"min-width:100%;border-collapse:collapse;table-layout:fixed!important\">\n" +
"    <tbody class=\"m_1364387473476751262mcnDividerBlockOuter\">\n" +
"        <tr>\n" +
"            <td class=\"m_1364387473476751262mcnDividerBlockInner\" style=\"min-width:100%;padding:18px 18px 0px\">\n" +
"                <table class=\"m_1364387473476751262mcnDividerContent\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"                    <tbody><tr>\n" +
"                        <td>\n" +
"                            <span></span>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnBoxedTextBlock\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    \n" +
"	<tbody class=\"m_1364387473476751262mcnBoxedTextBlockOuter\">\n" +
"        <tr>\n" +
"            <td valign=\"top\" class=\"m_1364387473476751262mcnBoxedTextBlockInner\">\n" +
"                \n" +
"				\n" +
"                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width:100%;border-collapse:collapse\" class=\"m_1364387473476751262mcnBoxedTextContentContainer\">\n" +
"                    <tbody><tr>\n" +
"                        \n" +
"                        <td style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:18px\">\n" +
"                        \n" +
"                            <table border=\"0\" cellpadding=\"18\" cellspacing=\"0\" class=\"m_1364387473476751262mcnTextContentContainer\" width=\"100%\" style=\"min-width:100%!important;background-color:#f7f7f7;border-collapse:collapse\">\n" +
"                                <tbody><tr>\n" +
"                                    <td valign=\"top\" class=\"m_1364387473476751262mcnTextContent\" style=\"color:#808080;font-family:Helvetica;font-size:16px;line-height:200%;text-align:center;word-break:break-word\">\n" +
"                                        <h3 style=\"display:block;margin:0;padding:0;color:#444444;font-family:Helvetica;font-size:22px;font-style:normal;font-weight:bold;line-height:150%;letter-spacing:normal;text-align:center\">Exciting features on the site</h3>\n" +
"\n" +
"<div style=\"text-align:left\"><br>\n" +
"People on the site share posts everyday&nbsp;and chat&nbsp;with one another about the work they do, while enjoying hundreds of videos, movies, TV shows, music, TV channels, radio channels, and games streamed privately&nbsp;almost&nbsp;exactly&nbsp;at the same time with everyone&nbsp;present in the board.</div>\n" +
"\n" +
"                                    </td>\n" +
"                                </tr>\n" +
"                            </tbody></table>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"				\n" +
"                \n" +
"				\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table></td>\n" +
"										</tr>\n" +
"									</tbody></table>\n" +
"									\n" +
"								</td>\n" +
"                            </tr>\n" +
"                            <tr>\n" +
"								<td align=\"center\" valign=\"top\" id=\"m_1364387473476751262templateFooter\" style=\"background:#333333 none no-repeat center/cover;background-color:#333333;background-image:none;background-repeat:no-repeat;background-position:center;background-size:cover;border-top:0;border-bottom:0;padding-top:45px;padding-bottom:63px\">\n" +
"									\n" +
"									<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262templateContainer\" style=\"border-collapse:collapse;max-width:600px!important\">\n" +
"										<tbody><tr>\n" +
"                                			<td valign=\"top\" class=\"m_1364387473476751262footerContainer\" style=\"background:transparent none no-repeat center/cover;background-color:transparent;background-image:none;background-repeat:no-repeat;background-position:center;background-size:cover;border-top:0;border-bottom:0;padding-top:0;padding-bottom:0\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnFollowBlock\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    <tbody class=\"m_1364387473476751262mcnFollowBlockOuter\">\n" +
"        <tr>\n" +
"            <td align=\"center\" valign=\"top\" style=\"padding:9px\" class=\"m_1364387473476751262mcnFollowBlockInner\">\n" +
"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnFollowContentContainer\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    <tbody><tr>\n" +
"        <td align=\"center\" style=\"padding-left:9px;padding-right:9px\">\n" +
"            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width:100%;border-collapse:collapse\" class=\"m_1364387473476751262mcnFollowContent\">\n" +
"                <tbody><tr>\n" +
"                    <td align=\"center\" valign=\"top\" style=\"padding-top:9px;padding-right:9px;padding-left:9px\">\n" +
"                        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\">\n" +
"                            <tbody><tr>\n" +
"                                <td align=\"center\" valign=\"top\">\n" +
"                                    \n" +
"                                    \n" +
"                                        \n" +
"                                        \n" +
"                                        \n" +
"                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"display:inline;border-collapse:collapse\">\n" +
"                                                <tbody><tr>\n" +
"                                                    <td valign=\"top\" style=\"padding-right:10px;padding-bottom:9px\" class=\"m_1364387473476751262mcnFollowContentItemContainer\">\n" +
"                                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnFollowContentItem\" style=\"border-collapse:collapse\">\n" +
"                                                            <tbody><tr>\n" +
"                                                                <td align=\"left\" valign=\"middle\" style=\"padding-top:5px;padding-right:10px;padding-bottom:5px;padding-left:9px\">\n" +
"                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"\" style=\"border-collapse:collapse\">\n" +
"                                                                        <tbody><tr>\n" +
"                                                                            \n" +
"                                                                                <td align=\"center\" valign=\"middle\" width=\"24\" class=\"m_1364387473476751262mcnFollowIconContent\">\n" +
"                                                                                    <a href=\"https://www.facebook.com/chilltechnologies\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=en&amp;q=https://www.facebook.com/chilltechnologies&amp;source=gmail&amp;ust=1504727902326000&amp;usg=AFQjCNEULzGuIvni7FZA425q_oQSWGTBsg\"><img src=\"https://ci4.googleusercontent.com/proxy/8j-DDnLusVH50YFUKm2i383mq41zzkTF0OmfaicBkjqbHcMUathKBT2sedC9niEZakoPEtRHargdZ4RbQjfIuq8GbtTu18d89xfHhaPIB2F5Lpp4cNaLZoDImoeXaRHVsy7_i-xdOFXoMg=s0-d-e1-ft#https://cdn-images.mailchimp.com/icons/social-block-v2/outline-light-facebook-48.png\" style=\"display:block;border:0;height:auto;outline:none;text-decoration:none\" height=\"24\" width=\"24\" class=\"CToWUd\"></a>\n" +
"                                                                                </td>\n" +
"                                                                            \n" +
"                                                                            \n" +
"                                                                        </tr>\n" +
"                                                                    </tbody></table>\n" +
"                                                                </td>\n" +
"                                                            </tr>\n" +
"                                                        </tbody></table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody></table>\n" +
"                                        \n" +
"                                        \n" +
"                                    \n" +
"                                        \n" +
"                                        \n" +
"                                        \n" +
"                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"display:inline;border-collapse:collapse\">\n" +
"                                                <tbody><tr>\n" +
"                                                    <td valign=\"top\" style=\"padding-right:10px;padding-bottom:9px\" class=\"m_1364387473476751262mcnFollowContentItemContainer\">\n" +
"                                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnFollowContentItem\" style=\"border-collapse:collapse\">\n" +
"                                                            <tbody><tr>\n" +
"                                                                <td align=\"left\" valign=\"middle\" style=\"padding-top:5px;padding-right:10px;padding-bottom:5px;padding-left:9px\">\n" +
"                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"\" style=\"border-collapse:collapse\">\n" +
"                                                                        <tbody><tr>\n" +
"                                                                            \n" +
"                                                                                <td align=\"center\" valign=\"middle\" width=\"24\" class=\"m_1364387473476751262mcnFollowIconContent\">\n" +
"                                                                                    <a href=\"https://chillonline.net\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=en&amp;q=https://chillonline.net&amp;source=gmail&amp;ust=1504727902326000&amp;usg=AFQjCNGi6uz469pIiKS2-ezEn31uwQKwLg\"><img src=\"https://ci5.googleusercontent.com/proxy/5y8PimBRwcJBDb92kgDtUSrz_5KShhUQXNrb_Q28YQUosmMtQUAzDq9N6tEwFsnVGQP4sLp24o68NhNmE3IMgZZ6NHCKjsRv-MAYKV-cZyd_4N9RZ82T8Z0xDMI-awQpxRK2_me4=s0-d-e1-ft#https://cdn-images.mailchimp.com/icons/social-block-v2/outline-light-link-48.png\" style=\"display:block;border:0;height:auto;outline:none;text-decoration:none\" height=\"24\" width=\"24\" class=\"CToWUd\"></a>\n" +
"                                                                                </td>\n" +
"                                                                            \n" +
"                                                                            \n" +
"                                                                        </tr>\n" +
"                                                                    </tbody></table>\n" +
"                                                                </td>\n" +
"                                                            </tr>\n" +
"                                                        </tbody></table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody></table>\n" +
"                                        \n" +
"                                        \n" +
"                                    \n" +
"                                        \n" +
"                                        \n" +
"                                        \n" +
"                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"display:inline;border-collapse:collapse\">\n" +
"                                                <tbody><tr>\n" +
"                                                    <td valign=\"top\" style=\"padding-right:0;padding-bottom:9px\" class=\"m_1364387473476751262mcnFollowContentItemContainer\">\n" +
"                                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnFollowContentItem\" style=\"border-collapse:collapse\">\n" +
"                                                            <tbody><tr>\n" +
"                                                                <td align=\"left\" valign=\"middle\" style=\"padding-top:5px;padding-right:10px;padding-bottom:5px;padding-left:9px\">\n" +
"                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"\" style=\"border-collapse:collapse\">\n" +
"                                                                        <tbody><tr>\n" +
"                                                                            \n" +
"                                                                                <td align=\"center\" valign=\"middle\" width=\"24\" class=\"m_1364387473476751262mcnFollowIconContent\">\n" +
"                                                                                    <a href=\"https://www.linkedin.com/company/chill-technologies-inc.?trk=ppro_cprof\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=en&amp;q=https://www.linkedin.com/company/chill-technologies-inc.?trk%3Dppro_cprof&amp;source=gmail&amp;ust=1504727902326000&amp;usg=AFQjCNFud_VBopTbl_kMsaFeijNUEM8ETg\"><img src=\"https://ci4.googleusercontent.com/proxy/XKgMJ7PipOogdjlwc3gffKOEd3ZL3UzwEBPyKMafBqO4Wo-a3qPu4Zkjk1nkaVVRiPJp-y2iQvAyqSwIr2D8sDDbRshZobzmo1QOgBil8Hqd2Bk9N1R3WUCKWuhTDwkD-uUstv5FGyfYdQ=s0-d-e1-ft#https://cdn-images.mailchimp.com/icons/social-block-v2/outline-light-linkedin-48.png\" style=\"display:block;border:0;height:auto;outline:none;text-decoration:none\" height=\"24\" width=\"24\" class=\"CToWUd\"></a>\n" +
"                                                                                </td>\n" +
"                                                                            \n" +
"                                                                            \n" +
"                                                                        </tr>\n" +
"                                                                    </tbody></table>\n" +
"                                                                </td>\n" +
"                                                            </tr>\n" +
"                                                        </tbody></table>\n" +
"                                                    </td>\n" +
"                                                </tr>\n" +
"                                            </tbody></table>\n" +
"                                        \n" +
"                                        \n" +
"                                    \n" +
"                                    \n" +
"                                </td>\n" +
"                            </tr>\n" +
"                        </tbody></table>\n" +
"                    </td>\n" +
"                </tr>\n" +
"            </tbody></table>\n" +
"        </td>\n" +
"    </tr>\n" +
"</tbody></table>\n" +
"\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnDividerBlock\" style=\"min-width:100%;border-collapse:collapse;table-layout:fixed!important\">\n" +
"    <tbody class=\"m_1364387473476751262mcnDividerBlockOuter\">\n" +
"        <tr>\n" +
"            <td class=\"m_1364387473476751262mcnDividerBlockInner\" style=\"min-width:100%;padding:18px\">\n" +
"                <table class=\"m_1364387473476751262mcnDividerContent\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width:100%;border-top:2px solid #505050;border-collapse:collapse\">\n" +
"                    <tbody><tr>\n" +
"                        <td>\n" +
"                            <span></span>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"m_1364387473476751262mcnTextBlock\" style=\"min-width:100%;border-collapse:collapse\">\n" +
"    <tbody class=\"m_1364387473476751262mcnTextBlockOuter\">\n" +
"        <tr>\n" +
"            <td valign=\"top\" class=\"m_1364387473476751262mcnTextBlockInner\" style=\"padding-top:9px\">\n" +
"              	\n" +
"			    \n" +
"				\n" +
"                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%;min-width:100%;border-collapse:collapse\" width=\"100%\" class=\"m_1364387473476751262mcnTextContentContainer\">\n" +
"                    <tbody><tr>\n" +
"                        \n" +
"                        <td valign=\"top\" class=\"m_1364387473476751262mcnTextContent\" style=\"padding-top:0;padding-right:18px;padding-bottom:9px;padding-left:18px;word-break:break-word;color:#ffffff;font-family:Helvetica;font-size:12px;line-height:150%;text-align:center\">\n" +
"                        \n" +
"                            <em>Copyright © 2017. Chill Technologies Inc., All rights reserved.</em><br>\n" +
"<br>\n" +
"<br>\n" +
"<strong>Our mailing address is:</strong><br>\n" +
"621 Avila Avenue, Winnipeg, Manitoba, Canada<br>\n" +
"&nbsp;\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </tbody></table>\n" +
"				\n" +
"                \n" +
"				\n" +
"            </td>\n" +
"        </tr>\n" +
"    </tbody>\n" +
"</table></td>\n" +
"										</tr>\n" +
"									</tbody></table>\n" +
"									\n" +
"								</td>\n" +
"                            </tr>\n" +
"                        </tbody></table>\n" +
"                        \n" +
"                    </td>\n" +
"                </tr>\n" +
"            </tbody></table>\n" +
"        </center><div class=\"yj6qo\"></div><div class=\"adL\">\n" +
"    </div></div><div class=\"adL\">\n" +
"\n" +
"</div></div></div>";
            
            
            
            
            boolean sessionDebug = false;
            
            Properties props = System.getProperties();
            
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");
            
            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from, "Chillonline Boarding Services"));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setContent(messageHTML, "text/html; charset=utf-8");
            
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, username, password);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            System.out.println("Message sent successfully!");
            
        }
        
        catch (Exception ex)
            
        {
            System.out.println(ex);
        }
        
    }
    
    public String getRecipientFirstName() 
    
    {
        return recipientFirstName;
    }

    public void setRecipientFirstName(String recipientFirstName) 
    
    {
        this.recipientFirstName = recipientFirstName;
    }

    public String getRecipientLastName() 
    
    {
        return recipientLastName;
    }

    public void setRecipientLastName(String recipientLastName) 
    
    {
        this.recipientLastName = recipientLastName;
    }

    public String getRecipientEmail() 
    
    {
        return recipientEmail;
    }

    public void setRecipientEmail(String recipientEmail) 
    
    {
        this.recipientEmail = recipientEmail;
    }

    public String getSenderFirstName() 
    
    {
        return senderFirstName;
    }

    public void setSenderFirstName(String senderFirstName) 
    
    {
        this.senderFirstName = senderFirstName;
    }

    public String getSenderClientName() 
    
    {
        return senderClientName;
    }

    public void setSenderClientName(String senderClientName) 
    
    {
        this.senderClientName = senderClientName;
    }

    public String getBoardName() 
    
    {
        return boardName;
    }

    public void setBoardName(String boardName) 
    
    {
        this.boardName = boardName;
    }

    public String getBoardHostName() 
    
    {
        return boardHostName;
    }

    public void setBoardHostName(String boardHostName) 
    
    {
        this.boardHostName = boardHostName;
    }

    public String getBoardAccessMode() 
    
    {
        return boardAccessMode;
    }

    public void setBoardAccessMode(String boardAccessMode) 
    
    {
        this.boardAccessMode = boardAccessMode;
    }

    public int getBoardCount() 
    
    {
        return boardCount;
    }

    public void setBoardCount(int boardCount) 
    
    {
        this.boardCount = boardCount;
    }

    public String getOrganizationName() 
    
    {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) 
    
    {
        this.organizationName = organizationName;
    }

    public String getTeamName() 
    
    {
        return teamName;
    }

    public void setTeamName(String teamName) 
    
    {
        this.teamName = teamName;
    }
    
}
