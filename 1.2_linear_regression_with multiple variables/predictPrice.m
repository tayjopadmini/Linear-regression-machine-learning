function housePrice = predictPrice (inputX, t, mean, std)
%%Normalizing the input to the function
normalized_X = (inputX(:) - mean(:)) ./ std(:);

%%Adding the bias to the input vector
New_X = [ones(1,1),normalized_X'];
%%disp(New_X);

%%calculating the price of house with new inputs
housePrice = t * New_X';

disp(housePrice);

end