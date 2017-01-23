
function table = getTrajectoryPairs(data, lane, minTrajectoryLenght)

    % Filter the data based on the lane and make sure follower - leader
    % fields are not -1
    lane_data = data((data(:,3)==lane & data(:,9)~=-1 & data(:,10)~=-1),:);
    unique_vehicles = unique(lane_data(:,1));

    pairArr = [];
    leaderArr = [];
    followerArr = [];
    timeArr = [];

    count = 0;
    for i=1:(length(unique_vehicles)-1)
        % Filter data based on follower and leader fields
        leader_data = lane_data((lane_data(:,1)==unique_vehicles(i) & ...
            lane_data(:,9)==unique_vehicles(i+1)),:);
        follower_data = lane_data((lane_data(:,1)==unique_vehicles(i+1) & ...
            lane_data(:,10)==unique_vehicles(i)),:);

        % Find the common start - end times of the trajectory
        maxStartTime = max(min(leader_data(:,2)), min(follower_data(:,2)));
        minEndTime = min(max(leader_data(:,2)), max(follower_data(:,2)));

        if (maxStartTime < minEndTime)
            % Filter leader and follower data based on the start-end time 
            leader_data = leader_data(find(leader_data(:,2)>=maxStartTime & ...
            leader_data(:,2)<=minEndTime),:);
            follower_data = follower_data(find(follower_data(:,2)>=maxStartTime & ...
                follower_data(:,2)<=minEndTime),:);

            time = 1:length(leader_data);

            % Check minimum trajectory length and data lenght 
            if(length(leader_data)>minTrajectoryLenght && ...
                    length(leader_data)==length(follower_data))

                count = count + 1;
                % Accumulate results in respective arrays
                leaderArr = [leaderArr; leader_data(:,4)];
                followerArr = [followerArr; follower_data(:,4)];
                timeArr = [timeArr; time'];
                pairArr = [pairArr; repmat(count, length(leader_data), 1)];
            end   
        end
    end

    % Save the data as a matrix. 
    % Matrix format: |Pair_no|Leader_position|Follower_position|time| 
    table = [pairArr, leaderArr, followerArr, timeArr] ;
        
        
