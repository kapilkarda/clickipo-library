//package com.example.courtcounter;//package com.example.courtcounter;
//
//import android.os.Bundle;
//import android.util.Log;
//import android.view.View;
//import android.widget.Button;
//
//import androidx.appcompat.app.AppCompatActivity;
//
//import io.flutter.embedding.android.FlutterActivity;
//
//
//public class CounterActivity extends AppCompatActivity {
//
//    Button flutterButton;
//
//    public static void startActivity() {
//    }
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_counter);
//
//        flutterButton = findViewById(R.id.flutterbutton);
//        flutterButton.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Log.e("onClick: ANKITA","ANKITA" );
//                startActivity(
//                FlutterActivity
//                        .withNewEngine()
//                        .initialRoute("splashRoute")
//                        .build(CounterActivity.this)
//
//        );
//
//            }
//        });
//    }
//
//}


package com.example.courtcounter;//package com.example.courtcounter;

import android.appwidget.AppWidgetHost;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;

import androidx.appcompat.app.AppCompatActivity;

import io.flutter.embedding.android.FlutterActivity;


public class CounterActivity extends AppCompatActivity {

    Button flutterButton;
    private AppWidgetHost Flutter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_counter);
          String params = getIntent().getStringExtra("params");
         flutterButton = findViewById(R.id.flutterbutton);
        // View flutterView = Flutter.createView(this, getLifecycle(), "service");
//        flutterButton = findViewById(R.id.flutterbutton);
        flutterButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.e("onClick: ANKITA","ANKITA" );
                startActivity(
                FlutterActivity
                        .withNewEngine()
                        .initialRoute("splashRoute")
                        .build(CounterActivity.this)

        );

            }
        });
    }

}






































//import android.os.Bundle;
//import android.util.Log;
//import android.view.View;
//import android.widget.Button;
//import android.widget.TextView;
//
//
//import io.flutter.app.FlutterActivity;
//import io.flutter.plugin.common.MethodChannel;
////import io.flutter.view.FlutterNativeView;
//
//
//public class CounterActivity extends FlutterActivity {
//
//    Button clickMeButton;
//    MethodChannel channel;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//
//        channel = new MethodChannel(getFlutterView(), "myChannel");
//
//        setContentView(R.layout.activity_counter);
//        clickMeButton = findViewById(R.id.flutterbutton);
//
//        clickMeButton.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//
//
//                channel.invokeMethod("methodNameItz", null, new MethodChannel.Result() {
//                    @Override
//                    public void success(Object o) {
//                        Log.d("Results", o.toString());
//                    }
//                    @Override
//                    public void error(String s, String s1, Object o) {
//                    }
//                    @Override
//                    public void notImplemented() {
//                    }
//                });
//            }
//        });
//    }
//}

