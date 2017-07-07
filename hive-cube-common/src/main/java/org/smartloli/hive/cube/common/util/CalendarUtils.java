/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.smartloli.hive.cube.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Convert the date or time to the specified format.
 *
 * @author smartloli.
 *
 *         Created by Nov 6, 2015
 */
public class CalendarUtils {

	/**
	 * Convert time mill into ? day ? hour ? min ? sec.
	 * 
	 * @param timeMill
	 *            Time mill.
	 * @return Character,from "3600 sec" to "0 Day 1 Hour 0 Min 0 Sec".
	 */
	public static String convertTimeMill2Date(long timeMill) {
		long day = timeMill / (3600 * 24);
		long hour = (timeMill - 3600 * 24 * day) / (60 * 60);
		long min = (timeMill - 3600 * 24 * day - 3600 * hour) / 60;
		long sec = timeMill - 3600 * 24 * day - 3600 * hour - 60 * min;
		return day + "Day" + hour + "Hour" + min + "min" + sec + "sec";
	}

	/**
	 * Convert unix time to date,default is yyyy-MM-dd HH:mm:ss.
	 * 
	 * @param unixtime
	 * @return Date String.
	 */
	public static String convertUnixTime(long unixtime) {
		String formatter = "yyyy-MM-dd HH:mm:ss";
		return convertUnixTime(unixtime, formatter);
	}

	/**
	 * Convert unix time to formatter date.
	 * 
	 * @param unixtime
	 * @param formatter
	 * @return Date String.
	 */
	public static String convertUnixTime(long unixtime, String formatter) {
		SimpleDateFormat df = new SimpleDateFormat(formatter);
		return df.format(new Date(unixtime));
	}

	/**
	 * Convert unix time to date,default is yyyy-MM-dd HH:mm:ss.
	 * 
	 * @param unixTime
	 * @return 1907-01-01 00:00:00
	 */
	public static String convertUnixTime2Date(long unixtime) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date(unixtime));
	}

	/** Convert str date to cron. */
	public static String convertTime2Cron(long mill) {
		SimpleDateFormat sdf = new SimpleDateFormat("ss mm HH dd MM ? yyyy");
		return sdf.format(new Date(mill));
	}

	/** Get the date of the day,accurate to seconds. */
	public static String getDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date());
	}

	/** Get custom date,like yyyy/mm/dd etc. */
	public static String getCustomDate(String formatter) {
		SimpleDateFormat df = new SimpleDateFormat(formatter);
		return df.format(new Date());
	}

	/** Formatter local date to US. */
	public static String formatLocale(String locale) throws ParseException {
		SimpleDateFormat dfs = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
		String formatStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dfs.parse(locale));
		return formatStr;
	}

	/** Formatter date to day. */
	public static long formatDays(String date) throws ParseException {
		long start = new Date().getTime();
		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long offset = start - dfs.parse(date).getTime();
		return Math.round(offset * 1.0 / (1000 * 3600 * 24));
	}

}
