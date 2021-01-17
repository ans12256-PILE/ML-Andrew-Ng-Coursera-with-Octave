% plot multivariable data
close all

[index, tmp] = find(data(:,2) == 1);
data_1b = data(index, [1 3]);
[index, tmp] = find(data(:,2) == 2);
data_2b = data(index, [1 3]);
[index, tmp] = find(data(:,2) == 3);
data_3b = data(index, [1 3]);
[index, tmp] = find(data(:,2) == 4);
data_4b = data(index, [1 3]);
[index, tmp] = find(data(:,2) == 5);
data_5b = data(index, [1 3]);

plot(data_1b(:,1), data_1b(:,2),'ko', 'markersize', 12, 'markerfacecolor', 'k')
hold on
plot(data_2b(:,1), data_2b(:,2),'ro', 'markersize', 12, 'markerfacecolor', 'r')
plot(data_3b(:,1), data_3b(:,2),'g<', 'markersize', 12, 'markerfacecolor', 'g')
plot(data_4b(:,1), data_4b(:,2),'bs', 'markersize', 12, 'markerfacecolor', 'b')
plot(data_5b(:,1), data_5b(:,2),'k^', 'markersize', 12, 'markerfacecolor', 'k')

% Gradient descent results @ alpha = 1.0
theta_F = [340412.659574;  110631.050279; -6649.474271];

Line1 = "Normalize ar_n=(area-2000.7)/794.7024, bd_n=(bedrooms-3.1702)/.7610";
Line2 = "Pricepredict = 340412.659574 + ar_n*110631.050279 + bd_n*-6649.474271";

text (100, 750000, {Line1, Line2}, "fontsize", 25)

% mu = 2.0007e+03   3.1702e+00
% sigma = 794.7024     0.7610
 %340412.659574
%110631.050279
 %-6649.474271

% plot "bedroom" one variable regression approximations
bed_x=[852 4478];  % min max house area values enough for line 
bed_x_norm = (bed_x-2000.7)/794.7024;
bed_num_norm = ([1 2 3 4 5] - 3.1702e+00)/0.7610;
bed_data_n1 = [ones(5,1) ones(5,1)*bed_x_norm(1) bed_num_norm'];
bed_data_n2 = [ones(5,1) ones(5,1)*bed_x_norm(2) bed_num_norm'];
theta_bed = [340412.659574 110631.050279 -6649.474271];
reg_min_area = bed_data_n1 * theta_bed';
reg_max_area = bed_data_n2 * theta_bed';
plot(bed_x, [reg_min_area(1) reg_max_area(1)],'k:', "linewidth", 1)
plot(bed_x, [reg_min_area(2) reg_max_area(2)],'r', "linewidth", 1)
plot(bed_x, [reg_min_area(3) reg_max_area(3)],'g', "linewidth", 1)
plot(bed_x, [reg_min_area(4) reg_max_area(4)],'b--', "linewidth", 1)
plot(bed_x, [reg_min_area(5) reg_max_area(5)],'k', "linewidth", 1)

predic_Area = [1000 1300 1650 2300 3300];  % spread areas for different bedroom ##'s
predic_Area_norm = (predic_Area-2000.7)/794.7024;
% bed_num_norm is already available
predic_data = [ones(5,1) predic_Area_norm' bed_num_norm'];
predic_price = predic_data * theta_bed';
markers = ['ko'; 'ro'; 'g<'; 'bs'; 'k^'];
marker_col = ['w'; 'r'; 'g'; 'b'; 'w' ];
for i=1:5
  plot(predic_Area(i), predic_price(i), markers(i,:), ...
  'markerfacecolor', marker_col(i,:), 'markersize', 24, ...
  'markeredgecolor', 'black')
end

legends_str = ['1b'; '2b'; '3b'; '4b'; '5b'; ...
'bed_1'; 'bed_2'; 'bed_3'; 'bed_4'; 'bed_5'; ...
'pr_1b'; 'pr_2b'; 'pr_3b'; 'pr_4b'; 'pr_5b'];
legend(legends_str, "location", "southeast", "fontsize", 35)  % bottom right corner

xlabel('House area [feet²], Portland OR, USA. Bedrooms  1~5', "fontsize", 25)
%ylabel('Sold price, $, and Multiple Variables (area, ## bedrooms) linear predictions')
title("Coursera Andrew Ng Machine Learning, Week 2 \n ...
Sold price, $, and Multiple Variables (area, ## bedrooms) ...
linear predictions", "fontsize", 35)
% Predicted price of a 1650 sq-ft, 3 br house (using gradient descent):
%price_result = 293081.464335;
%predic = [1650, price_result];
%plot(predic(:,1), predic(:,2),'gp', 'markersize', 24, 'markerfacecolor', 'g',
%'markeredgecolor', 'black')



