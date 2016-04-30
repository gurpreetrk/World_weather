package com.weather;

import com.weather.CityWeather;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author Gurpreet
 * Test Class for validating DropDown data from CityName.json 
 * in CityWeather Class
 *
 */
public class CityWeatherTest 
{
	@Test
	public void testGetCityWeather()
	{
		List<String> resultArray =new ArrayList<String>();
		resultArray.add("Perth");
		resultArray.add("Sydney");
		resultArray.add("Melbourne");
		resultArray.add("Brisbane");
		resultArray.add("Hobart");
		resultArray.add("Meerut");
		resultArray.add("Delhi");
		CityWeather cw=new CityWeather();
		//System.out.println("---> "+cw.getCity());
		assertEquals(cw.getCity(),resultArray);
	}
}
