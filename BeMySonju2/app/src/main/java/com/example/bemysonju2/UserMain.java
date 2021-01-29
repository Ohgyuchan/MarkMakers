package com.example.bemysonju2;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class UserMain extends AppCompatActivity {
    private Button btn_vc; //영상통화
    private Button btn_fd;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_main);

        //btn_vc = findViewById(R.id.btn_vc);
        btn_fd = findViewById(R.id.btn_fd);
        btn_vc = findViewById(R.id.btn_vc);

        btn_fd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(UserMain.this, FeedWrite.class);
                startActivity(intent);
            }
        });

        btn_vc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(UserMain.this, VcActivity.class);
                startActivity(intent);
            }
        });
    }
}