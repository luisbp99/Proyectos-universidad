% dfreq: display frequency. To prevent excessive output, results are displayed
% only for the first node, the last node, and when the node number is a multiple of dfreq.
%
% ex: indicates whether the exact solution is known (ex = 1) or not (ex != 1).
%
% ofi: file identifier for the output file.

% Define indexes for nodes based on the display frequency
indexes = 1:N;
idx = find(indexes == 1 | mod(indexes, dfreq) == 0 | indexes == N);  % Nodes to display
xdisp = x(idx);  % x-coordinates of nodes to display
yhdisp = yh(idx, :);  % Approximate solution values at display nodes
Ndisp = length(idx);  % Total number of nodes to display

% Prepare table headers
if (ex == 1)  % Case where exact solution is known
    fprintf(ofi, '\n\n%-6s %-15s %-20s %-20s %-15s\n', ...
            'Step', 'Node', 'Approx. Solution', 'Exact Solution', 'Error (2-norm)');
else  % Case where exact solution is unknown
    fprintf(ofi, '\n\n%-6s %-15s %-20s\n', ...
            'Step', 'Node', 'Approx. Solution');
end

% Loop through display nodes and output results
for i = 1:Ndisp
    if (ex == 1)  % With exact solution
        % Calculate exact solution and error at each node
        exa = exact(xdisp(i));
        error = norm(exa - yhdisp(i, :));  % 2-norm of the error
        
        % Output main row details: step, x value, approx and exact solutions, error
        fprintf(ofi, '%-6d %-15.4E %-20.6E %-20.6E %-15.6E\n', ...
                idx(i), xdisp(i), yhdisp(i, 1), exa(1), error);
        
        % Print additional dimensions for m > 1
        if m > 1
            for j = 2:m
                fprintf(ofi, '%-22s %-20.6E %-20.6E\n', '', yhdisp(i, j), exa(j));
            end
        end
    else  % Without exact solution
        % Output main row details: step, x value, approx solution
        fprintf(ofi, '%-6d %-15.4E %-20.6E\n', idx(i), xdisp(i), yhdisp(i, 1));
        
        % Print additional dimensions for m > 1
        if m > 1
            for j = 2:m
                fprintf(ofi, '%-22s %-20.6E\n', '', yhdisp(i, j));
            end
        end
    end
end
