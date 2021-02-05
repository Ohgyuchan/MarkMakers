package com.example.bemysonju2;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class UserMain extends AppCompatActivity {
    private Button btn_vc; // 영상통화버튼
    private Button btn_fd; // 피드게시물 버튼
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_main);

        btn_fd = findViewById(R.id.btn_fd); //피드 버튼 아이디로 연결
        btn_vc = findViewById(R.id.btn_vc); //영상통화 버튼 아이디로 연결

        btn_fd.setOnClickListener(new View.OnClickListener() { //피드 버튼이 클릭이 되는지 받는 함수
            @Override
            public void onClick(View view) { //피드 버튼이 클릭이 되면
                Intent intent = new Intent(UserMain.this, FeedWrite.class); //UserMain class에서 FeedWrite class로 이동(Intent)
                startActivity(intent);
            }
        });

        btn_vc.setOnClickListener(new View.OnClickListener() {  // 영상통화 버튼이 클릭이 되는지 받는 함수
            @Override
            public void onClick(View view) { // 영상통화 버튼이 클릭이 되면
                Intent intent = new Intent(UserMain.this, VcActivity.class); //영상통화 class로 이동(Intent)
                startActivity(intent);
            }
        });
    }
}
