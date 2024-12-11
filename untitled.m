%% HW5 - Undirected Network Routing (Modified)
% 방향성이 없는 그래프 정의
clear; clc;

% 노드와 엣지 정의
nodes = {'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'M'};
edges = {'P', 'Q'; 'Q', 'R'; 'R', 'S'; 'P', 'T'; 'T', 'U'; ...
         'Q', 'V'; 'R', 'T'; 'W', 'Y'; 'S', 'W'; 'T', 'X'; 'P', 'Y'; ...
         'U', 'V'; 'V', 'W'; 'W', 'M'; 'X', 'Y'; 'Y', 'Z'; 'Z', 'M'};

% 방향성이 없는 그래프 생성
G = graph(edges(:, 1), edges(:, 2), [], nodes);

% 각 엣지에 대해 랜덤 딜레이 할당 (10 ~ 20 사이 정수)
numEdges = numedges(G);
delays = randi([10, 20], 1, numEdges); % 랜덤 딜레이
G.Edges.Weight = delays'; % 딜레이를 Weight로 저장

% 노드의 (x, y) 좌표 설정
nodeX = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4];  % x 좌표
nodeY = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2];  % y 좌표

% 그래프 시각화 (명시적 좌표 설정)
h = plot(G, 'XData', nodeX, 'YData', nodeY, 'NodeLabel', nodes, ...
         'EdgeLabel', G.Edges.Weight);

% 스타일 추가
h.MarkerSize = 8;               % 노드 크기
h.NodeColor = 'b';              % 노드 색 (파란색)
h.EdgeColor = [0.5, 0.5, 0.5];  % 엣지 색 (회색)
h.LineWidth = 1;                % 엣지 두께
title('Undirected Network Routing (Modified)'); % 제목

% 특정 노드에서 최단 경로 계산 (Y, Q, S)
disp('Routing Tables from Nodes Y, Q, S:');
startNodes = {'Y', 'Q', 'S'}; % 계산할 시작 노드

for i = 1:length(startNodes)
    startNode = startNodes{i};
    fprintf('\nRouting Table from Node %s:\n', startNode);
    for j = 1:length(nodes)
        % 시작 노드로부터 각 노드까지의 거리 계산
        dist = distances(G, startNode, nodes{j});
        % 시작 노드로부터 각 노드까지의 최적 경로 계산
        path = shortestpath(G, startNode, nodes{j});
        fprintf('From %s to %s: Distance = %d, Path = %s\n', ...
                startNode, nodes{j}, dist, strjoin(path, '->'));
    end
end

% 딜레이 업데이트 (조건에 맞게 변경)
disp('\nUpdating Delays from Node Y...');
updateEdges = {'Y', 'P'; 'Y', 'W'; 'Y', 'X'; 'Y', 'Z'}; % 업데이트할 간선
updateDelays = [4, -2, 7, 3]; % 변경 값

% 딜레이 업데이트
for i = 1:length(updateEdges)
    edgeIdx = findedge(G, updateEdges{i, 1}, updateEdges{i, 2});
    if edgeIdx > 0
        G.Edges.Weight(edgeIdx) = G.Edges.Weight(edgeIdx) + updateDelays(i);
    end
end

% 업데이트된 그래프 시각화
figure;
h = plot(G, 'XData', nodeX, 'YData', nodeY, 'NodeLabel', nodes, ...
         'EdgeLabel', G.Edges.Weight);
h.MarkerSize = 8;
h.NodeColor = 'b';
h.EdgeColor = [0.5, 0.5, 0.5];
h.LineWidth = 1;
title('Updated Undirected Network Routing (Modified)');

% 업데이트된 특정 노드에서 최단 경로 계산 (Y, Q, S)
disp('\nUpdated Routing Tables for Nodes Y, Q, S:');
for i = 1:length(startNodes)
    startNode = startNodes{i};
    fprintf('\nUpdated Routing Table from Node %s:\n', startNode);
    for j = 1:length(nodes)
        % 시작 노드로부터 각 노드까지의 거리 계산
        dist = distances(G, startNode, nodes{j});
        % 시작 노드로부터 각 노드까지의 최적 경로 계산
        path = shortestpath(G, startNode, nodes{j});
        fprintf('From %s to %s: Distance = %d, Path = %s\n', ...
                startNode, nodes{j}, dist, strjoin(path, '->'));
    end
end
