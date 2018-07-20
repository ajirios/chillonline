/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object.board.posts;

import document.board.posts.DocumentBoardPostList;
import join.board.posts.JoinBoardPostList;
import notice.board.posts.NoticeBoardPostList;
import photo.board.posts.PhotoBoardPostList;
import video.board.posts.VideoBoardPostList;

/**
 *
 * @author El Jefe
 */
public class VideoObjectBoardPostList 

{
    private long boardID;
    private int size;
    private static Object[] objects;
    private long[] times;
    
    private DocumentBoardPostList documentPostList;
    private PhotoBoardPostList photoPostList;
    private NoticeBoardPostList noticePostList;
    private JoinBoardPostList joinPostList;
    private VideoBoardPostList videoPostList;
    
    public VideoObjectBoardPostList(long boardID)
            
    {
        this.boardID = boardID;
        
        this.documentPostList = new DocumentBoardPostList(boardID);
        this.photoPostList = new PhotoBoardPostList(boardID);
        this.noticePostList = new NoticeBoardPostList(boardID);
        this.joinPostList = new JoinBoardPostList(boardID);
        this.videoPostList = new VideoBoardPostList(boardID);
        
        this.size = getObjectBoardPostCount();
        this.objects = new Object[this.size];
        this.times = new long[this.size];
        
        populateObjects();
        
    }
    
    private void populateObjects()
            
    {
        int count;
        int start = 0;
        int innerCount = 0;
        
        for (count = start; innerCount < this.documentPostList.getSize(); count++)
            
        {
            
            this.objects[count] = this.documentPostList.getDocumentBoardPost(innerCount);
            this.times[count] = this.documentPostList.getDocumentBoardPost(innerCount).getLongitudinalCreationDate();
            innerCount++;
            
        }
        
        start = this.documentPostList.getSize();
        innerCount = 0;
        
        for (count = start; innerCount < this.photoPostList.getSize(); count++)
            
        {
            
            this.objects[count] = this.photoPostList.getPhotoBoardPost(innerCount);
            this.times[count] = this.photoPostList.getPhotoBoardPost(innerCount).getLongitudinalCreationDate();
            innerCount++;
            
        }
        
        start = start + this.photoPostList.getSize();
        innerCount = 0;
        
        for (count = start; innerCount < this.noticePostList.getSize(); count++)
            
        {
            
            this.objects[count] = this.noticePostList.getNoticeBoardPost(innerCount);
            this.times[count] = this.noticePostList.getNoticeBoardPost(innerCount).getLongitudinalCreationDate();
            innerCount++;
            
        }
        
        start = start + this.noticePostList.getSize();
        innerCount = 0;
        
        for (count = start; innerCount < this.joinPostList.getSize(); count++)
            
        {
            
            this.objects[count] = this.joinPostList.getJoinBoardPost(innerCount);
            this.times[count] = this.joinPostList.getJoinBoardPost(innerCount).getLongitudinalCreationDate();
            innerCount++;
            
        }
        
        start = start + this.joinPostList.getSize();
        innerCount = 0;
        
        for (count = start; innerCount < this.videoPostList.getSize(); count++)
            
        {
            
            this.objects[count] = this.videoPostList.getVideoBoardPost(innerCount);
            this.times[count] = this.videoPostList.getVideoBoardPost(innerCount).getLongitudinalCreationDate();
            innerCount++;
            
        }
        
        quickSort(this.times);
        
    }
    
    public Object getObjectBoardPost(int count)
            
    {
        return this.objects[count];
    }
    
    public int getObjectBoardPostCount()
            
    {
        int count;
        
        count = documentPostList.getSize() + photoPostList.getSize() + noticePostList.getSize() + joinPostList.getSize() + videoPostList.getSize();
        
        return count;
    }
    
    public int length()
            
    {
        return this.objects.length;
    }
    
    public int getSize()
            
    {
        return this.size;
    }
  
  /**
   * Sort an integer array recursively, using quick sort.
   * 
   * @param  array   the integer array to be sorted
   *                          the array integers are sorted in increasing order
   */
  public static void quickSort(long[] array)
    
  {
    
    //call helper method
    quickSort(array, 0, array.length);
    
  }
  
  /**
   * Sort an integer array recursively, using quick sort.
   * 
   * @param  int[] array   the integer array to be sorted
   *                       the array integers are sorted in increasing order
   * @param  int start     the element position to start sorting from
   *                          
   * @param  int end       the element position before which the sort must stop
   *                                                                   
   */
  private static void quickSort(long[] array, int start, int end)
    
  {
    //declare the pivot position
    int pivotPosition;
    
    //base case, when array length is equal to 2
    if (end - start == 2)
      
    {
      
      //when next element is less than the current
      if (array[start + 1] < array[start])
        
      {
        
        //swap the two
        swap(array, start + 1, start);
        
      }
      
    }
    
    //when array length is greater than 2  
    else if (end - start > 2)
      
    {
      
      //choose a pivot position and partition the array
      choosePivot(array, start, end);
      pivotPosition = partition(array, start, end);
      
      //recursively quick sort the array using this same method
      quickSort(array, start, pivotPosition);
      quickSort(array, pivotPosition + 1, end);
      
    }
    
  }
  
  /**
   * Swap elements in two positions in an array.
   * 
   * @param  int[] array             the integer array to be swapped
   *                                 array elements are swapped
   * @param  int previousPosition    the previous position
   *                          
   * @param  int currentPosition     the current position
   *                                                                  
   */
  private static void swap(long[] array, int previousPosition, int currentPosition)
    
  {
    //declare a temporary integer variable
    long temp;
    Object tempString;
    
    //store one position's element in the temporary variable
    temp = array[previousPosition];
    tempString = objects[previousPosition];
    
    //swap the two elements
    array[previousPosition] = array[currentPosition];
    array[currentPosition] = temp;
    
    objects[previousPosition] = objects[currentPosition];
    objects[currentPosition] = tempString;
    
  }
  
  /**
   * Choose a pivot in an array of integers using median-of-three.
   * 
   * @param  int[] array   the integer array to be sorted
   *                       array integers are swapped
   * @param  int start     the first of three element positions
   *                       could be swapped depending on situation
   * @param  int end       the last of three element positions
   *                       could be swapped depending on situation                                             
   */
  private static void choosePivot(long[] array, int start, int end)
    
  {
    //declare needed variables
    int mid;
    long temp;
    Object tempString;
    
    //instantiate the mid position
    mid = start + (end - start) / 2;
    
    //when mid is the median
    if ((array[start] < array[mid] && array[mid] <= array[end - 1]) || (array[end - 1] < array[mid] && array[mid] < array[start]))
      
    {
      //the element at the mid position is made the median
      temp = array[start];
      array[start] = array[mid];
      array[mid] = temp;
      
      tempString = objects[start];
      objects[start] = objects[mid];
      objects[mid] = tempString;
      
    }
    
    //when the end position is the median
    else if ((array[mid] < array[end - 1] && array[end - 1] < array[start]) || (array[start] < array[end - 1] && array[end - 1] < array[mid]))
      
    {
      
      //the element at the end position is made the median
      temp = array[start];
      array[start] = array[end - 1];
      array[end - 1] = temp;
      
      tempString = objects[start];
      objects[start] = objects[end - 1];
      objects[end - 1] = tempString;
      
    }
    
  }
  
  /**
   * Separate elements smaller than the pivot from elements larger than or equal to the pivot.
   * 
   * @param  int[] array   the integer array to be sorted
   *                       array integers are repositioned
   * @param  int start     the element position to start sorting from
   *                       
   * @param  int end       the element position before which the sort must stop
   *                                                                    
   */
  private static int partition(long[] array, int start, int end)
    
  {
    //declare variables
    long pivot;
    int bigStart;
    
    //initialize variables
    pivot = array[start];
    bigStart = start + 1;
    
    //loop from the second position from start to the end
    for (int current = start + 1; current < end; current++)
      
    {
      //when the pivot is greater than the current element
      if (array[current] < pivot)
        
      {
        
        //swap elements and increment
        swap(array, current, bigStart);
        bigStart++;
        
      }
      
    }
    
    //swap pivot with largest smaller element
    swap(array, start, bigStart - 1);
    
    //return the pivot
    return bigStart - 1;
    
  }
    
    public static void print(long[] array)
            
    {
        
        for (int count = 0; count < array.length; count++)
            
        {
            System.out.println(array[count]);
        }
        
    }
    
}
