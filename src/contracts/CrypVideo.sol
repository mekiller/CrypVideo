pragma solidity ^0.5.0;


contract CrypVideo {
  uint public videoCount = 0;
  string public name = "CrypVideo";
  mapping(uint =>Video)public videos;
  //Create id=>struct mapping
  
  //Create Struct
  struct Video{
    uint id;
    string hash;
    string title;
    address author;
  }

  //Create Event
  //This is going subscribe us to the event, when we trigger the app
  event VideoUploaded(
    uint id,
    string hash,
    string title,
    address author
  );


  constructor() public {
  }

  function uploadCrypVideo(string memory _videoHash, string memory _title) public {
    // Requirement for video Hash, Title,Address 
    require(bytes(_videoHash).length > 0);
    require(bytes(_title).length >0);
    require(msg.sender != address(0));

   
    videoCount ++;

    // Add video to the contract
    videos[videoCount] =  Video(videoCount,_videoHash,_title,msg.sender);

    
    emit uploadCrypVideo(videoCount, _videoHash, _title, msg.sender);

  }
}
