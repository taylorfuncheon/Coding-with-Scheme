//Original loop
public class laxLoop {
	
	public static void main(String[] args) {
		
		
		// create array with saves in each game
		int [] saves = {8, 10, 6, 13, 9};
		
		// variable with saves combined
		int totalSaves = 0;
		
		for (int i = 0; i < saves.length; i++ ) {
			
			totalSaves += saves[i];
		}
		
		System.out.println("Total saves: " + totalSaves);
		
	}

}

Total saves: 46

//Functional Loop

import java.util.Arrays;


public class laxFunctional {
	
	public static void main (String[] args) {
		
		int [] saves = {8, 10, 6, 13, 9};
		
		int totalSaves = Arrays.stream(saves)
				.reduce(0,(total, save)-> total + save);
		
		System.out.println("Total Saves: " + totalSaves);
		
	}

}
Total saves: 46

//For me, my original loop was easier for me to read just because I’ve seen more loops than I have seen the reduce function. 
I needed to re-teach it to myself before I did this. It’s also easier because it’s easier to read when it’s more split up/divided.  
