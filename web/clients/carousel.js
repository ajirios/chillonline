/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var channel0 = {
    
    name: "Hangers",
    source: "../channels/1-0000-0031/hangers.png",
    description: "Hangers is a television network for watching friends and colleagues that regularly hang out at certain spots from time to time. \n\
We highlight friend groups and the relationships they have, following the tracks of relationships as they progress through varieties of experiences\n\
common through life. This is to show just how important and delicate relationships are in the life that we live in. Hangers does this by bringing to you, \n\
lengthy series and movies that rein in particularly on friendships."
};

var channel1 = {
    
    name: "Cheese",
    source: "../channels/1-0000-0010/cheese.png",
    description: "Cheese brings a thin comedic play on stereotypical romantic overtures made by men and women in the cut-throat dating world. A fairly good amount of our content is on the outcomes of dates, specifically in restaurants, in the woods, on vacations, on tours, and even during the courting process. Our network portrays just how easy it is, and also just how important it is, that we become cheesy when faced with bleak romantic chances."
};

var channel2 = {
    
    name: "Dream Channel",
    source: "../channels/1-0000-0054/thedreamchannel.png",
    description: "Dream Channel is the ideal network for inspiring those who are interested in personal mood regulation through inspiration. During the daytime, we strongly feature movies and series about people who have done the impossible to overcome all odds and achieve success, despite trying times and opposition from the world. In the night time, we show movies and series about the romantic overturns of those whose relationships have stood the test of time and come out successful."
};

var channel3 = {
    
    name: "Gear",
    source: "../channels/1-0000-0027/gear.png",
    description: "Gear is for engineers and aspiring engineers who often need a network to see how other engineers go into the real practical world and solve highly daring problems. You can see works by mechanical engineers, civil engineers, aerospace engineers, networking and technology engineers, hardware engineers. You can see stuff related to robotics and automation, CNC, injection molding, casting, heat engines, and fluid mechanics."
};

var channel4 = {
    
    name: "Crackers",
    source: "../channels/1-0000-0018/crackers.png",
    description: "Sometimes, all you just need is a good laugh. With Crackers, you can get to see the world's most rib-cracking videos streamed in real-time. Videos from all countries range from home videos, to politics, to court cases, to educational institutions, and even sometimes to transportation networks and religious settings. Whatever it is, you are sure to have a good laugh!"
};

var channel5 = {
    
    name: "Cocktails",
    source: "../channels/1-0000-0016/cocktails.png",
    description: "Enjoy a night out at the bar with your friends with Cocktails. You are sure to watch ladies and gentlemen alike stumble themselves over trying to impress one another. Cocktails reveals the ravenous experiences of challenged and experienced men and women in the dating world. Whatever it is, we are sure you'd be enlightened by some of our most exciting dating tips."
};

var channel6 = {
    
    name: "Travels",
    source: "../channels/1-0000-0057/travels.png",
    description: "Travels helps you experience the scenery of our beautiful world through your screen. Everyday, we go from place to place, talking to people from a variety of cultures and taking the most breathtaking shots of enthralling cities from sky scraping as well as ground-hugging angles. You can experience thrilling adventures embarked on by our crew members and co-producers."
};

var channel7 = {
    
    name: "Movie Talk",
    source: "../channels/1-0000-0038/moviechannel.png",
    description: "Movie Talk is entertainment reviews at its finest. We introduce videos on serious chats about what is happening in the movie world. We invite guests to our home station every week, where our host speakers engage to delve deep into their personal stories about horrific experiences and delighting life moments. Every now and then, we also like to show the latest blockbuster movie that is trending in the theatres. This is surely a must-watch!"
};

var channel8 = {
    
    name: "Woods",
    source: "../channels/1-0000-0007/cabin.png",
    description: "We take you into the solitary and secluded life of the woods, where our most inspiring nature lovers live, subtracted from grid and city life. Delightful scenes of farm life are shown on a daily basis, hinging on key activities like cattle rearing, vegetable growing, tuber digging, hay stacking, and horseback riding. You may also be thrilled to watch the endangered clan-to-clan dynamics of pre-industrial suburban living. Heck, we may even throw in from time to time, delicious scenes of once-in-a-lifetime seen animals."
};

var channel9 = {
    
    name: "Nuclear",
    source: "../channels/1-0000-0040/nuclear.png",
    description: "Experience the atom at its most endearing level, the nuclear level! We delve into physics and astrophysics at its most captivating and detailed state, bringing mind-blowing nuclear experiments and experiences to you on screen. Of course, we do not forget to regularly teach you detailed intricacies of the mathematics used by astrophysicists and geophysicists to solve the biggest aerospace problems of our age."
};

var channel10 = {
    
    name: "Sunspot",
    source: "../channels/1-0000-0052/sunspot.png",
    description: "Sunspot brings you the delightful life of the coastal areas. Beach parties, sand castles, Spanish fiestas, and washing shores, it all comes down to how greatly you can enjoy life when you chill at the beach with peeps. Our experiences also permeate into hotels and restaurants, and how tasteful life can be when you hang around with your friends and family in the sunlight."
};

var array = [channel0, channel1, channel2, channel3, channel4, channel5, channel6, channel7, channel8, channel9, channel10];

var index = 0;

document.getElementById("content").src = array[index].source;
        
document.getElementById("content-header").innerHTML = array[index].name;

document.getElementById("content-par").innerHTML = array[index].description;

function getPreviousChannel()
{
    
    
    if (index > 0)
        
    {
        index--;
        
        document.getElementById("content").src = array[index].source;
        
        document.getElementById("content-header").innerHTML = array[index].name;
        
        document.getElementById("content-par").innerHTML = array[index].description;
    }
    
    else
    {
        index = array.length - 1;
        
        document.getElementById("content").src = array[index].source;
        
        document.getElementById("content-header").innerHTML = array[index].name;
        
        document.getElementById("content-par").innerHTML = array[index].description;
    }
    
}

function getNextChannel()
{
    if (index < array.length - 1)
        
    {
        index++;
        
        document.getElementById("content").src = array[index].source;
        
        document.getElementById("content-header").innerHTML = array[index].name;
        
        document.getElementById("content-par").innerHTML = array[index].description;
    }
    
    else
    {
        index = 0;
        
        document.getElementById("content").src = array[index].source;
        
        document.getElementById("content-header").innerHTML = array[index].name;
        
        document.getElementById("content-par").innerHTML = array[index].description;
    }
    
}

