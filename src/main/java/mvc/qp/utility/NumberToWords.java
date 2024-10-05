package mvc.qp.utility;

public class NumberToWords {

	private static final String[] units = { "", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE",
			"TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN",
			"NINETEEN" };
	private static final String[] tens = { "", "", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY",
			"NINETY" };

	public static String convert(double number) {
		if (number < 0) {
			return "MINUS " + convert(-number);
		}
		if (number == 0) {
			return "ZERO";
		}

		String words = "";

		long dollars = (long) number;
		long cents = Math.round((number - dollars) * 100);

		if (dollars > 0) {
			words += convertDollars(dollars);
		}

		if (cents > 0) {
			words += " AND " + convertDollars(cents) + " CENTS";
		}

		return words.trim();
	}

	private static String convertDollars(long number) {
		if (number < 20) {
			return units[(int) number];
		}
		if (number < 100) {
			return tens[(int) (number / 10)] + " " + units[(int) (number % 10)];
		}
		if (number < 1000) {
			return units[(int) (number / 100)] + " HUNDRED " + convertDollars(number % 100);
		}
		if (number < 1000000) {
			return convertDollars(number / 1000) + " THOUSAND " + convertDollars(number % 1000);
		}
		return "";
	}
}
