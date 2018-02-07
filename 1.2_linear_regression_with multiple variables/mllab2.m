%% This loads our data
[X, y] = load_data_ex2();

%% Normalise and initialize.
[X, mean_vec, std_vec] = normalise_features(X);

%after normalising we add the bias
X = [ones(size(X, 1), 1), X];


%initialise theta
theta = zeros(1,size(X,2));
alpha = 0.1;
iterations = 100;

%% 
t = gradient_descent(X, y, theta, alpha, iterations);
disp 'Press enter to exit!';
pause;

disp(t)

fprintf('Predicting the price of the following house\n');
house1 = [1650 3];
fprintf('Sq ft =' ) ;
disp(house1(1,1))
fprintf('No of bedrooms = ')
disp(house1(1,2));
fprintf('price = GBP ')
price = predictPrice(house1,t,mean_vec,std_vec);


fprintf('Predicting the price of the following house\n');
house2 = [3000 4];
fprintf('Sq ft =' ) ;
disp(house2(1,1))
fprintf('No of bedrooms = ')
disp(house2(1,2));
fprintf('price = GBP ')
price = predictPrice(house2,t,mean_vec,std_vec);
