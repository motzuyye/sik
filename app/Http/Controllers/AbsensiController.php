<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Session;
use Carbon\Carbon;
use App\Absensi;
use App\Tower;
use App\Kantor;
use DB;
use App\Traits\DateTraits;

class AbsensiController extends Controller
{
    use DateTraits;

    public function index()
    {
        $dt = Carbon::now();
        $date = $dt->format('Y-m-d H:i:s');
        $tgl = $dt->format('Y-m-d');
        $jam = $dt->format('H-m-d');

        
        if ( Auth::user()->level == 'pegawai' ) {
            $data   =   Absensi::with(['pegawai','kantor'])
                ->select( DB::raw("absensi.*, YEAR(absensi.tanggal) as tahun, MONTH(absensi.tanggal) as bulan, gaji.id as has_gaji"))
                ->leftJoin('gaji', function($join) {
                    $join->on(  "gaji.tahun", '=', DB::raw('YEAR(absensi.tanggal)'));
                    $join->on(  "gaji.bulan", '=', DB::raw('MONTH(absensi.tanggal)'));
                    $join->on(  "gaji.id_pegawai", '=', 'absensi.id_pegawai');
                })
                ->where('absensi.id_pegawai', auth()->id() )
                ->orderBy('absensi.tanggal', 'desc')->get();
        }else{
            $data   =   Absensi::with(['pegawai','kantor'])
                            ->select( DB::raw("absensi.*, YEAR(absensi.tanggal) as tahun, MONTH(absensi.tanggal) as bulan, gaji.id as has_gaji"))
                            ->leftJoin('gaji', function($join) {
                                $join->on(  "gaji.tahun", '=', DB::raw('YEAR(absensi.tanggal)'));
                                $join->on(  "gaji.bulan", '=', DB::raw('MONTH(absensi.tanggal)'));
                                $join->on(  "gaji.id_pegawai", '=', 'absensi.id_pegawai');
                            })
                            ->orderBy('absensi.tanggal', 'desc')->get();

        }

        $yearMonth = $this->getYearMonth();

        //$data = Absensi::with('pegawai')->orderBy('tanggal', 'desc')->get();
        return view('absensi.index', compact('data', 'date', 'tgl','jam', 'yearMonth'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $dt = Carbon::now();
        $date = $dt->format('Y-m-d H:i:s');
        $tgl = $dt->format('Y-m-d');
        $jam = $dt->format('H-m-d');
        //$tower = Tower::orderBy('nama', 'asc')->get();
        $kantor = Kantor::first();

        $absen = Absensi::whereDate('tanggal', $tgl)
        ->where('id_pegawai', auth()->id() )
        ->first();


        if(!is_null($absen)){
            if( !is_null($absen->jam_masuk) && !is_null($absen->jam_pulang) ){
                Session::flash('full_absen', 'Anda Sudah Absen Hari ini!');
                return back();
            }

        }
        
        return view('absensi.add', compact('absen','date', 'tgl','jam','kantor'));

    }

    public function store(Request $request)
    {

        $data = (array) $request->except(['id','jam','absen','submit']);
        if( $request->absen == 'masuk') $data['jam_masuk'] = $request->jam;
        if( $request->absen == 'pulang') $data['jam_pulang'] = $request->jam;
        $data['status'] = 'hadir';
        //Absensi::create($data);

        $absensi = Absensi::updateOrCreate(
            ['id' => $request->id],
            $data
        );

        Session::flash('message', 'Permohonan berhasil ditambahkan!');
        Session::flash('message_type', 'success');
        return redirect('/absensi');
    }
    
    public function edit($id)
    {
        $kantor = Kantor::orderBy('nama', 'asc')->first();
        if (Auth::user()->level == 'pegawai') {
            return back();
        }else{
            $data = Absensi::with(['pegawai', 'kantor'])->where('id', $id)->get();
            return view('absensi.edit', compact('data', 'kantor'));
        }
    }

    public function update(Request $request, $id)
    {
        $data = (array) $request->except(['id','submit']);
        
        Absensi::find($id)->update($data);
        return redirect('/absensi');
    }
    
    public function delete($id)
    {
        Absensi::find($id)->delete();

        Session::flash('message', 'Absen berhasil dihapus!');
        Session::flash('message_type', 'success');
        return back();
    }
}
