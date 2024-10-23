function plutoradiodoc(topic)
% PLUTORADIODOC ADALM-PLUTO Radio function to open doc.
%
% PLUTORADIODOC  Open top-level ADALM-PLUTO Radio documentation.
%
% PLUTORADIODOC(topic) Open specific topic in documentation.  
% 

% Copyright 2016-2023 The MathWorks, Inc.

if (nargin == 0)
    topic = 'sdrpluto_doccenter';
end
helpview('comm', topic);
