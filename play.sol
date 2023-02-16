pragma solidity ^0.8.0;

contract EarnAsYouPlay {
    mapping(address => uint256) public points;
    uint256 public reward;

    function earnPoints(uint256 earnedPoints) public {
        points[msg.sender] += earnedPoints;
    }

    function redeemPoints() public {
        require(points[msg.sender] >= reward, "You do not have enough points to redeem a reward");
        msg.sender.transfer(reward);
        points[msg.sender] -= reward;
    }

    struct user{
        uint256 id,
        string name,
        uint256 amount
        

        function buyProduct(productId, quantity, paymentInfo) {
  return new Promise((resolve, reject) => {
    // make an HTTP POST request to the server to buy the product
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/api/buy');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = () => {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          // the purchase was successful
          const response = JSON.parse(xhr.responseText);
          resolve(response);
        } else {
          // there was an error purchasing the product
          reject(new Error('Unable to purchase product'));
        }
      }
    };
    const data = { productId: productId, quantity: quantity, paymentInfo: paymentInfo };
    xhr.send(JSON.stringify(data));
  });
}


}
