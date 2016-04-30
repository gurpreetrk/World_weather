package com.weather;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

//import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CityWeather 
{
	@ModelAttribute("cityList")
	public List<String> getCity()
	{
		JSONParser parser = new JSONParser();
		List<String> cityList = new ArrayList<String>();
		try 
		{
			Resource resource = new ClassPathResource("CityName.json");
			FileReader fr = new FileReader(resource.getFile());
			Object obj = parser.parse(fr);
			JSONObject jsonObject = (JSONObject) obj;
			JSONArray msg = (JSONArray) jsonObject.get("City");
			Iterator<String> iterator = msg.iterator();
			String selCity="";
			while (iterator.hasNext()) 
			{
				selCity=iterator.next();
				cityList.add(selCity);
			}
		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return cityList;
	}
	
	@RequestMapping("/weather")
	public ModelAndView showMessage(@ModelAttribute("city1") CityBean city,Map<String, CityBean> model)
	{		
		ModelAndView mv = new ModelAndView("DisplayWeather");
		CityBean cb=new CityBean();
		model.put("cb",cb);
		return mv;
	}
	
}