// SPDX-License-Identifier: Apache-2.0
// Example of Voronoi DAO in Solidity, by QRUCIAL OÜ
// Setup: One leader (could be CEO, Prime Minister, etc irl) and 10 voters (could be members of the board, etc).
// Code state: Beta
// Coder: Six

pragma solidity ^0.8.11;

contract VoronoiDAO {

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    event major_impact_call(bool value);                                                 // Event when a Major Impact Function is called
    event minor_impact_call(bool value);                                                 // Event when a Minor Impact Function is called
    event function_unlock(uint256 value);                                                // Unlock event, when a function gets unlocked, unit256 -> func ID
    
    mapping (uint256 => address) internal unlocker_ids;                                  // Needs to be in sync with the unlocker_ids, max 10
    mapping (uint256 => uint256) internal unlocker_stakes;                               // Address to threshold amount (single account can have multiple)
    mapping (uint256 => uint256) internal voronoi_function_count;                        // Some functions need to be controlled separately
    mapping (uint256 => address) internal nominee;                                       // Possibilty to nominate. To get in, vouches are needed.
    mapping (uint256 => uint256) internal nominee_vouch;
    uint256 private nominee_position;

    address private Executive;
    uint256 private _voronoi_count;
    uint256 private threshold;
    uint256 private _voronoi_last_time;

    bool private _paused;

    constructor() {
        Executive = msg.sender;                                                              // The Executive is the one who starts the DAO! Can be modified by voting.
        _paused = false;
        _voronoi_count = 0;
        threshold = 4;
        _voronoi_last_time = block.timestamp;
        unlocker_ids[0] = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        unlocker_ids[1] = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        unlocker_ids[2] = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        unlocker_ids[3] = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
        unlocker_ids[4] = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
        unlocker_ids[5] = 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C;
        unlocker_ids[6] = 0x583031D1113aD414F02576BD6afaBfb302140225;
        unlocker_ids[7] = 0x583031D1113aD414F02576BD6afaBfb302140225;
        unlocker_ids[8] = 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC;
        unlocker_ids[9] = 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC;
        unlocker_stakes[0] = 1;
        unlocker_stakes[1] = 1;
        unlocker_stakes[2] = 1;
        unlocker_stakes[3] = 1;
        unlocker_stakes[4] = 1;
        unlocker_stakes[5] = 1;
        unlocker_stakes[6] = 1;
        unlocker_stakes[7] = 1;
        unlocker_stakes[8] = 1;
        unlocker_stakes[9] = 1;
        voronoi_function_count[0] = 0;
        voronoi_function_count[1] = 0;
    }

    function voronoi_vote_up_main() external returns (bool success){
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);

        if (msg.sender == unlocker_ids[0]){
            require(unlocker_stakes[0] == 1);
            unlocker_stakes[0] = 0;
        }
        else if (msg.sender == unlocker_ids[1]) {
            require(unlocker_stakes[1] == 1);
            unlocker_stakes[1] = 0;
        }
        else if (msg.sender == unlocker_ids[2]) {
            require(unlocker_stakes[2] == 1);
            unlocker_stakes[2] = 0;
        }
        else if (msg.sender == unlocker_ids[3]) {
            require(unlocker_stakes[3] == 1);
            unlocker_stakes[3] = 0;
        }
        else if (msg.sender == unlocker_ids[4]) {
            require(unlocker_stakes[4] == 1);
            unlocker_stakes[4] = 0;
        }
        else if (msg.sender == unlocker_ids[5]) {
        require(unlocker_stakes[5] == 1);
            unlocker_stakes[5] = 0;
        }
        else if (msg.sender == unlocker_ids[6]) {
        require(unlocker_stakes[6] == 1);
            unlocker_stakes[6] = 0;
        }
        else if (msg.sender == unlocker_ids[7]) {
            require(unlocker_stakes[7] == 1);
            unlocker_stakes[7] = 0;
        }
        else if (msg.sender == unlocker_ids[8]) {
            require(unlocker_stakes[8] == 1);
            unlocker_stakes[8] = 0;
        }
        else if (msg.sender == unlocker_ids[9]) {
            require(unlocker_stakes[9] == 1);
            unlocker_stakes[9] = 0;
        }
        _voronoi_count = _voronoi_count + 1;
        return true;
    }

    function voronoi_vote_up_specific(uint256 _spec) external returns (bool success){
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);

        if (msg.sender == unlocker_ids[0]){
            require(unlocker_stakes[0] == 1);
            unlocker_stakes[0] = 0;
        }
        else if (msg.sender == unlocker_ids[1]) {
            require(unlocker_stakes[1] == 1);
            unlocker_stakes[1] = 0;
        }
        else if (msg.sender == unlocker_ids[2]) {
            require(unlocker_stakes[2] == 1);
            unlocker_stakes[2] = 0;
        }
        else if (msg.sender == unlocker_ids[3]) {
            require(unlocker_stakes[3] == 1);
            unlocker_stakes[3] = 0;
        }
        else if (msg.sender == unlocker_ids[4]) {
            require(unlocker_stakes[4] == 1);
            unlocker_stakes[4] = 0;
        }
        else if (msg.sender == unlocker_ids[5]) {
        require(unlocker_stakes[5] == 1);
            unlocker_stakes[5] = 0;
        }
        else if (msg.sender == unlocker_ids[6]) {
        require(unlocker_stakes[6] == 1);
            unlocker_stakes[6] = 0;
        }
        else if (msg.sender == unlocker_ids[7]) {
            require(unlocker_stakes[7] == 1);
            unlocker_stakes[7] = 0;
        }
        else if (msg.sender == unlocker_ids[8]) {
            require(unlocker_stakes[8] == 1);
            unlocker_stakes[8] = 0;
        }
        else if (msg.sender == unlocker_ids[9]) {
            require(unlocker_stakes[9] == 1);
            unlocker_stakes[9] = 0;
        }
        voronoi_function_count[_spec] = voronoi_function_count[_spec] + 1;
        return true;
    }

    function vcheck_state(uint256 _idToCheck) external view returns(uint256 success){
        return unlocker_stakes[_idToCheck];
    }

    function vcheck_count() external view returns(uint256 success){
        return _voronoi_count;
    }

    function v_reset() external returns (bool success){
        emit major_impact_call(true);
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);
        require(block.timestamp >= _voronoi_last_time + 15 minutes);                           // You can only do it once every 15 mins to secure voting logic
        _voronoi_last_time = block.timestamp;
        _voronoi_count = 0;
        voronoi_function_count[0] = 0;
        voronoi_function_count[1] = 0;
        unlocker_stakes[0] = 1;
        unlocker_stakes[1] = 1;
        unlocker_stakes[2] = 1;
        unlocker_stakes[3] = 1;
        unlocker_stakes[4] = 1;
        unlocker_stakes[5] = 1;
        unlocker_stakes[6] = 1;
        unlocker_stakes[7] = 1;
        unlocker_stakes[8] = 1;
        unlocker_stakes[9] = 1;
        nominee[0] = address(0);
        nominee_vouch[0] = 0;
        return true;
    }

    function voter_nominate(uint256 _position, address _new_addr) external returns (bool){
        require(block.timestamp >= _voronoi_last_time + 15 minutes);                       // Nomination can happen only once per 15 mins.
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);
        nominee[0] = _new_addr;
        nominee_position = _position;
        return true;
    }

    function voter_role_change() external returns (bool){                                           // Change or remove addresses.
        emit major_impact_call(true);
        require(voronoi_function_count[0] >= threshold);                                            // Needs to be specifically allowed!
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);
        unlocker_ids[nominee_position] = nominee[0];
        return true;
    }


    function pause() external returns (bool success) {
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);
        emit major_impact_call(true);
        require(_voronoi_count >= threshold);
        _paused = true;
        return _paused;
    }

    function unpause() external returns (bool success) {
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);
        emit major_impact_call(true);
        require(_voronoi_count >= threshold);
        _paused = false;
        return _paused;
    }

    function ExecutiveChange(address newExecutive) external returns (address to) {
        require(msg.sender == unlocker_ids[0] ||
        msg.sender == unlocker_ids[1] ||
        msg.sender == unlocker_ids[2] ||
        msg.sender == unlocker_ids[3] ||
        msg.sender == unlocker_ids[4] || 
        msg.sender == unlocker_ids[5] || 
        msg.sender == unlocker_ids[6] || 
        msg.sender == unlocker_ids[7] || 
        msg.sender == unlocker_ids[8] || 
        msg.sender == unlocker_ids[9]);
        emit major_impact_call(true);
        require(_voronoi_count >= threshold);
        require(address(newAdmin) != address(0));
        Executive = newExecutive;
        return newExecutive;
    }


    function ExecutiveWithdraw() external returns (bool success) {                         // If the DAO decides, the Executive can withdraw all Coins.
        require(msg.sender == Executive, "Not authorized");
        emit major_impact_call(true);
        require(voronoi_function_count[1] >= threshold);                                // Needs to be specifically allowed!
        payable(msg.sender).transfer(address(this).balance);
        return true;
    }

    fallback() external payable {}
    receive() external payable {}
}
