#include<iostream>  
#include<cmath>  
using namespace std;  

 int main()
 {  
   int a = 211, c = 1663, m = 7875, seed = 1, psr_amount;
   cout << "Generate pseudo-random values according to the rule: X_n+1 = (" << a << " * X_n + " << c << ") mod " << m << '\n';
   cout << "Number of pseudo-random values:\n";
   cin >> psr_amount; 
   int* rand = new int[psr_amount];  
   rand[0] = seed;  
   int i, j;  
   cout<<"\nGENERATED RANDOM NUMBERS:\n\n";  
   for (i = 0; i != psr_amount; i++)
   {  
		rand[i] = (a * rand[i - 1] + c) % m;    
		cout << "r" << i << "\t" << rand[i] << "\n";  
   }    

   int O_freq[20], n = 4, E_freq; //determine the frequency of values in the given segments
   E_freq = psr_amount / n;  
   for(j = 0; j <= n; j++)  
    	O_freq[j] = 0;  
   for(j = 0; j < psr_amount; j++)
   {  
		if(rand[j] <= 0 && rand[j] > -2000)  
			O_freq[0]++;  
		if(rand[j] <= -2000 && rand[j] > -4000)  
			O_freq[1]++;  
		if(rand[j] <= -4000 && rand[j] >= -6000)  
			O_freq[2]++;  
		if(rand[j] <= -6000 && rand[j] >= -8000)  
			O_freq[3]++; 
   }  

   float chi_squared_calc = 0, chi_squared_tab = 7.815, temp_sqr;  
   cout << "\nCOMPUTATION OF CHI-SQUARED\n";   
   for(j = 0; j < n; j++)
   {  
       temp_sqr = pow((O_freq[j] - E_freq), 2) / (double)E_freq;  
       chi_squared_calc += temp_sqr;  
       cout << 2000 * j << " <= r <" << 2000 * (j + 1) << ", " << "O_freq = " << O_freq[j] << ", " << "E_freq = " << E_freq << "\n";  
   }  
   cout << "---------------------------------------------\n";  
   cout << "\nChi-squared = " << chi_squared_calc<<"\n";  
   cout << "\nNu = " << n - 1 << "\tp = 95%\tTabulated value of chi-squared = 7.815" << "\n";
   cout << "\n\Theory of chi-squared is...\n";  
   if(chi_squared_calc<=chi_squared_tab)  
    	cout << "Approved!\n\n\n";  
   else  
    	cout << "Rejected...\n\n\n";  
   return 0;  
 }  
