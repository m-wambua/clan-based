function Beliefs = UpdateBeliefSystem( Beliefs, newBeliefs, worst, start )
%
%File name: UpdateBeliefSystem.m
%
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based Cultural Algorithm for 
% Feature Selection. In: IEEE International Conference on Data 
% Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% Copyright (c) 2019 Oloruntoba Oluwabunmi<bunmiotoba@gmail.com>.
% All Rights Reserved
%
% 
% Function to update the BeliefSystem repository of the Clan-Based Cultural Algorithm
%   The function takes as input the complete belief systema and the updates
%   to be incorporated into the beliefsystem. The new updates are tested to
%   determine their suitability for update. If the are deemed suitable, the
%   are incorporated into the belief system otherwise they are discarded.

%%
% determine the number of elements in newBeliefs
newBeliefsCount = size(newBeliefs,1);

% % if the accessment is at the start of the algorithm, update the belief system
if start == true    
    Beliefs.Situational = newBeliefs(1); %% the best individual is usually the first 
    % get the best individual    
    Beliefs.Normative.Max = newBeliefs(1);
    %get the worst individual    
    Beliefs.Normative.Min = worst; 
else       
    % Situational beliefs   
    if newBeliefs(1).accuracy > Beliefs.Situational.accuracy
        % better than previous best
        Beliefs.Situational        = newBeliefs(1);
    end
    % Normative beliefs
    if Beliefs.Normative.Max.accuracy <  newBeliefs(1).accuracy 
        Beliefs.Normative.Max = newBeliefs(1);        
    end
    if Beliefs.Normative.Min.accuracy > worst.accuracy
        Beliefs.Normative.Min = worst; newBeliefs(newBeliefsCount);
    end
end

end

