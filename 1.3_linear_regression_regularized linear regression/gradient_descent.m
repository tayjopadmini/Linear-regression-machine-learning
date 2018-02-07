function theta = gradient_descent(X, y, theta, alpha, iterations,l, do_plot)
    %GRADIENT_DESCENT do Gradient Descent for a given X, y, theta, alpha
    %for a specified number of iterations

    %if less than 6 arguments was given, then set do_plot to be false
    if nargin < 6
        do_plot = false;
    end
    if(do_plot)
        plot_hypothesis(X, y, theta);
        drawnow; pause(0.1); 
    end
    
    n = size(X,2); %number of columns in X that is number of features.
    m = size(X,1); %number of training examples
    cost_vector = []; %will store the results of our cost function

    for it = 1:iterations
        % gradient descent
      
            sigma = ones(1,n);

            for i = 1:m
            
                hypothesis = calculate_hypothesis(X,theta,i);
                output = y(i);
                sigma = sigma + (hypothesis - output) * X(i,:);
            
            end        
        %end
        theta(1) = theta(1) - (((alpha * 1.0) / m) * sigma(1));
        theta(2:end)=(theta(2:end)*(1-((alpha * l) / m))) - (((alpha * 1.0) / m) * sigma(2:n));
        %theta(2:n)=(theta(2:n)*(1-alpha*l/m)
        %update cost_vector
        cost_vector = [cost_vector; compute_cost_regularised(X, y, theta,l)];

        if do_plot
            plot_hypothesis(X, y, theta);
            drawnow; pause(0.1); 
        end
    end

    disp 'Gradient descent is finished.'
        
    if do_plot
        disp 'Press enter!'
        pause;
    end

    plot_cost(cost_vector);
        
    disp 'Press enter!';
    pause;
end