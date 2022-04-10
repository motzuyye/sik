<?php
namespace App\Traits;

use App\Absensi;
use Carbon\Carbon;
use DB;

trait DateTraits {
    protected $years = [
        2019,2020,2021,2022
    ];

    protected $months = [
        [
        	'name' => 'January',
        	'value' => 1,
        ],
        [
        	'name' => 'February',
        	'value' => 2,
        ],
        [
        	'name' => 'March',
        	'value' => 3,
        ],
        [
        	'name' => 'April',
        	'value' => 4,
        ],
        [
        	'name' => 'May',
        	'value' => 5,
        ],
        [
        	'name' => 'June',
        	'value' => 6,
        ],
        [
        	'name' => 'July',
        	'value' => 7,
        ],
        [
        	'name' => 'August',
        	'value' => 8,
        ],
        [
        	'name' => 'September',
        	'value' => 9,
        ],
        [
        	'name' => 'October',
        	'value' => 10,
        ],
        [
        	'name' => 'November',
        	'value' => 11,
        ],
        [
        	'name' => 'December',
        	'value' => 12,
        ],
    ];

    public function absensiYears(){
        if( $absensi = Absensi::select(DB::raw("DISTINCT YEAR(tanggal) as tahun"))->orderBy('tahun','desc')->get() ){
            $years = $absensi->pluck('tahun');
        }else{
            $years = [ now()->format('Y')];
        }
        return $years ;
    }

    public function getYearMonth()
    {
        $years = $this->absensiYears();
        $data = [
            'year' => $years,
            'month' => $this->months,
        ];

        return $data;
    }

    public function getYear()
    {
        return $this->years;
    }
    public function getMonth()
    {
        return $this->months;
    }
}