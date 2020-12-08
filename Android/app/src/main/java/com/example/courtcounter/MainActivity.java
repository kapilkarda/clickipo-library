//package com.example.courtcounter;//package com.example.courtcounter;
//
//import android.content.Intent;
//import android.os.Bundle;
//import android.os.Handler;
//import android.view.View;
//import android.view.WindowManager;
//import android.widget.Button;
//
//import androidx.appcompat.app.AppCompatActivity;
//
//import com.example.courtcounter.CounterActivity;
//
//import io.flutter.Log;
//import io.flutter.embedding.android.FlutterActivity;
//
//public class MainActivity extends AppCompatActivity {
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//
//
//        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
//                WindowManager.LayoutParams.FLAG_FULLSCREEN);
//
//        Intent i = new Intent(MainActivity.this,
//                CounterActivity.class);
//
//        startActivity(i);
//
//    }
//}


package com.example.courtcounter;//package com.example.courtcounter;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.example.courtcounter.CounterActivity;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends AppCompatActivity {
    Button flutterButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_counter);
//        CounterActivity.startActivity();

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        Intent i = new Intent(MainActivity.this,
                CounterActivity.class);

        startActivity(i);

    }
}

