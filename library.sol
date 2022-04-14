pragma solidity ^0.8.0;

library Tests{
    struct Test{
        uint256 a;
        bytes b;
    }


    function increment(Test storage test)public{
        test.a+=1;
    }

     function current(Test storage test) internal view returns (uint256) {
        return test.a;
    }

    function bytesLengthSet(Test storage test,bytes memory x)public {
        test.b=x;
    }

    function bytesLength(Test storage test)public view returns(uint256){
        return (test.b).length;
    }
}