/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dateline;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author El Jefe
 */
public class DateLineConversion 

{
    private String localDateTimeLine;
    private String foreignDateTimeLine;
    private long longitudinalDateTime;
    
    private int year;
    private int month;
    private int day;
    private int hour;
    private int minute;
    private int second;
    
    private String monthName;
    private String meridian;
    
    private String postTimestamp;
    
    public DateLineConversion(String foreignDateTimeLine) //20170807235643
            
    {
        this.foreignDateTimeLine = foreignDateTimeLine.trim();
        this.longitudinalDateTime = Long.parseLong(this.foreignDateTimeLine);
        this.localDateTimeLine = null;
        this.day = 0;
        this.hour = 0;
        this.minute = 0;
        this.month = 0;
        this.second = 0;
        this.year = 0;
        this.monthName = null;
        this.meridian = null;
        
        constructYear();
        constructMonth();
        constructDay();
        constructHour();
        constructMinute();
        constructSecond();
        constructMonthName();
        constructLocalDateTimeLine();
            
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String creationTime  = dateFormat.format(calendar.getTime());
        
        this.postTimestamp = setPostTimestamp(creationTime);
        
    }

    public String getPostTimestamp() 
    
    {
        return postTimestamp;
    }

    private String setPostTimestamp(String creationTime) 
    
    {
        this.postTimestamp = null;
        
        int realPostHour = Integer.parseInt(this.foreignDateTimeLine.substring(8, 10));
        
        int currentYearNumber = Integer.parseInt(creationTime.substring(0, 4));
        int currentMonthNumber = Integer.parseInt(creationTime.substring(4, 6));
        int currentDayNumber = Integer.parseInt(creationTime.substring(6, 8));
        int currentHourNumber = Integer.parseInt(creationTime.substring(8, 10));
        int currentMinuteNumber = Integer.parseInt(creationTime.substring(10, 12));
        int currentSecondNumber = Integer.parseInt(creationTime.substring(12, 14));
        
        if ((currentYearNumber == this.year) && (currentMonthNumber == this.month))
            
        {
            //same week days
            if (this.day != currentDayNumber)
                
            {
                
                if (this.day > currentDayNumber)
                    
                {
                    this.postTimestamp = String.valueOf(this.day - currentDayNumber) + " days ago";
                    
                    if (this.day - currentDayNumber == 1)
                        
                    {
                        this.postTimestamp = String.valueOf(this.day - currentDayNumber) + " day ago";
                    }
                }
                
                else
                    
                {
                    this.postTimestamp = String.valueOf(currentDayNumber - this.day) + " days ago";
                    
                    if (currentDayNumber - this.day == 1)
                        
                    {
                        this.postTimestamp = String.valueOf(currentDayNumber - this.day) + " day ago";
                    }
                    
                }
                
            }
            
            else
                
            {
                //same day, check hours
                if (realPostHour != currentHourNumber)
                    
                {
                    
                    if (realPostHour > currentHourNumber)
                        
                    {
                        this.postTimestamp = String.valueOf(realPostHour - currentHourNumber) + " hours ago";
                        
                        if (realPostHour - currentHourNumber == 1)
                            
                        {
                            this.postTimestamp = String.valueOf(realPostHour - currentHourNumber) + " hour ago";
                        }
                        
                    }
                    
                    else
                        
                    {
                        this.postTimestamp = String.valueOf(currentHourNumber - realPostHour) + " hours ago";
                        
                        if (currentHourNumber - realPostHour == 1)
                            
                        {
                            this.postTimestamp = String.valueOf(currentHourNumber - realPostHour) + " hour ago";
                        }
                        
                    }
                    
                }
                
                else
                    
                {
                    //same hour, check minutes
                    if (this.minute != currentMinuteNumber)
                        
                    {
                        
                        if (this.minute > currentMinuteNumber)
                            
                        {
                            this.postTimestamp = String.valueOf(this.minute - currentMinuteNumber) + " minutes ago";
                            
                            if (this.minute - currentMinuteNumber == 1)
                                
                            {
                                this.postTimestamp = String.valueOf(this.minute - currentMinuteNumber) + " minute ago";
                            }
                            
                        }
                        
                        else
                            
                        {
                            this.postTimestamp = String.valueOf(currentMinuteNumber - this.minute) + " minutes ago";
                            
                            if (currentMinuteNumber - this.minute == 1)
                                
                            {
                                this.postTimestamp = String.valueOf(currentMinuteNumber - this.minute) + " minute ago";
                            }
                            
                        }
                        
                    }
                    
                    else
                        
                    {
                        //same minute, check seconds
                        if (this.second >= currentSecondNumber)
                            
                        {
                            this.postTimestamp = String.valueOf(this.second - currentSecondNumber) + " seconds ago";
                            
                            if (this.second - currentSecondNumber == 1)
                                
                            {
                                this.postTimestamp = String.valueOf(this.second - currentSecondNumber) + " second ago";
                            }
                            
                        }
                        
                        else
                            
                        {
                            this.postTimestamp = String.valueOf(currentSecondNumber - this.second) + " seconds ago";
                            
                            if (currentSecondNumber - this.second == 1)
                                
                            {
                                this.postTimestamp = String.valueOf(currentSecondNumber - this.second) + " second ago";
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        else
            
        {
            this.postTimestamp = this.localDateTimeLine;
        }
        
        return postTimestamp;
    }
    
    private void constructYear()
            
    {
        this.year = Integer.parseInt(this.foreignDateTimeLine.substring(0, 4));
    }
    
    private void constructMonth()
            
    {
        this.month = Integer.parseInt(this.foreignDateTimeLine.substring(4, 6));
    }
    
    private void constructDay()
            
    {
        this.day = Integer.parseInt(this.foreignDateTimeLine.substring(6, 8));
    }
    
    private void constructHour()
            
    {
        this.hour = Integer.parseInt(this.foreignDateTimeLine.substring(8, 10));
        
        if (this.hour > 12)
            
        {
            this.hour = this.hour - 12;
            this.meridian = "p.m.";
        }
        
        else
            
        {
            this.meridian = "a.m.";
        }
        
    }
    
    private void constructMinute()
            
    {
        this.minute = Integer.parseInt(this.foreignDateTimeLine.substring(10, 12));
    }
    
    private void constructSecond()
            
    {
        this.second = Integer.parseInt(this.foreignDateTimeLine.substring(12, 14));
    }
    
    private void constructLocalDateTimeLine()
            
    {
        String yearString = String.valueOf(year);
        String dayString = String.valueOf(day);
        String hourString = String.valueOf(hour);
        
        this.localDateTimeLine = this.monthName + " " + dayString + ", " + yearString + " at " + hourString + ":" + this.foreignDateTimeLine.substring(10, 12) + this.meridian; 
        
    }
    
    private void constructMonthName()
            
    {
        if (this.month == 1)
            
        {
            this.monthName = "January";
        }
        
        else if (this.month == 2)
            
        {
            this.monthName = "February";
        }
        
        else if (this.month == 3)
            
        {
            this.monthName = "March";
        }
        
        else if (this.month == 4)
            
        {
            this.monthName = "April";
        }
        
        else if (this.month == 5)
            
        {
            this.monthName = "May";
        }
        
        else if (this.month == 6)
            
        {
            this.monthName = "June";
        }
        
        else if (this.month == 7)
            
        {
            this.monthName = "July";
        }
        
        else if (this.month == 8)
            
        {
            this.monthName = "August";
        }
        
        else if (this.month == 9)
            
        {
            this.monthName = "September";
        }
        
        else if (this.month == 10)
            
        {
            this.monthName = "October";
        }
        
        else if (this.month == 11)
            
        {
            this.monthName = "November";
        }
        
        else if (this.month == 12)
            
        {
            this.monthName = "December";
        }
        
    }

    public String getLocalDateTimeLine() 
    
    {
        return localDateTimeLine;
    }

    public void setLocalDateTimeLine(String localDateTimeLine) 
    
    {
        this.localDateTimeLine = localDateTimeLine;
    }

    public String getForeignDateTimeLine() 
    
    {
        return foreignDateTimeLine;
    }

    public void setForeignDateTimeLine(String foreignDateTimeLine) 
    
    {
        this.foreignDateTimeLine = foreignDateTimeLine;
    }

    public long getLongitudinalDateTime() 
    
    {
        return longitudinalDateTime;
    }

    public void setLongitudinalDateTime(long longitudinalDateTime) 
    
    {
        this.longitudinalDateTime = longitudinalDateTime;
    }

    public int getYear() 
    
    {
        return year;
    }

    public void setYear(int year) 
    
    {
        this.year = year;
    }

    public int getMonth() 
    
    {
        return month;
    }

    public void setMonth(int month) 
    
    {
        this.month = month;
    }

    public int getDay() 
    
    {
        return day;
    }

    public void setDay(int day) 
    
    {
        this.day = day;
    }

    public int getHour() 
    
    {
        return hour;
    }

    public void setHour(int hour) 
    
    {
        this.hour = hour;
    }

    public int getMinute() 
    
    {
        return minute;
    }

    public void setMinute(int minute) 
    
    {
        this.minute = minute;
    }

    public int getSecond() 
    
    {
        return second;
    }

    public void setSecond(int second) 
    
    {
        this.second = second;
    }

    public String getMonthName() 
    
    {
        return monthName;
    }

    public void setMonthName(String monthName) 
    
    {
        this.monthName = monthName;
    }

    public String getMeridian() 
    
    {
        return meridian;
    }

    public void setMeridian(String meridian) 
    
    {
        this.meridian = meridian;
    }
    
}
