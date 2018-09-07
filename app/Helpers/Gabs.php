<?php

namespace App\Helpers;
use Carbon\Carbon;

class Gabs {
    

    public static function currency($value)
    {
        $value = round($value,1);
        if($value > 0){
            if(config('site_settings.site_currency_format') == 'front'){
                return config('site_settings.site_currency_symbol').$value;
            } else {
                return $value . config('site_settings.site_currency_symbol');
            }
        } else {
            return $value;
        }
    }
    
    public static function currency_string($value)
    {
        $value = round($value,1);
        if($value > 0){
            if(config('site_settings.site_currency_format') == 'front'){
                return config('site_settings.site_currency_symbol').$value;
            } else {
                return $value . config('site_settings.site_currency_symbol');
            }
        } else {
            return __('t.free');
        }
    }
    
    
    public static function generateDateRange(Carbon $start_date, Carbon $end_date)
    {
        $dates = [];
    
        for($date = $start_date; $date->lte($end_date); $date->addDay()) {
            $dates[] = $date->format('Y-m-d');
        }
    
        return $dates;
    }
    
    
}