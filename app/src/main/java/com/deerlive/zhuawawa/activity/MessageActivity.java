package com.deerlive.zhuawawa.activity;

import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.deerlive.zhuawawa.R;
import com.deerlive.zhuawawa.adapter.NoticeAdapter;
import com.deerlive.zhuawawa.base.BaseActivity;
import com.deerlive.zhuawawa.common.Api;
import com.deerlive.zhuawawa.intf.OnRequestDataListener;
import com.deerlive.zhuawawa.model.NoticeMessageBean;
import com.deerlive.zhuawawa.utils.SPUtils;
import com.scwang.smartrefresh.layout.SmartRefreshLayout;
import com.scwang.smartrefresh.layout.api.RefreshLayout;
import com.scwang.smartrefresh.layout.listener.OnLoadmoreListener;
import com.scwang.smartrefresh.layout.listener.OnRefreshListener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import butterknife.Bind;

public class MessageActivity extends BaseActivity {


    @Bind(R.id.refreshLayout)
    SmartRefreshLayout mRefreshLayout;
    @Bind(R.id.recyclerview)
    RecyclerView mRecyclerView;
    @Bind(R.id.tv_title)
    TextView tvTitle;
    private String mToken;
    private ArrayList<NoticeMessageBean.InfoBean> mListData = new ArrayList();
    private NoticeAdapter mAdapter = new NoticeAdapter(mListData);
    private View notDataView;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        tvTitle.setText(getResources().getString(R.string.message));
        mToken = SPUtils.getInstance().getString("token");
        mRefreshLayout.autoRefresh();
        initMessageList();
    }

    private void initMessageList() {
        final LinearLayoutManager manager = new LinearLayoutManager(this);
        manager.setOrientation(LinearLayoutManager.VERTICAL);
        //mRecyclerView.addItemDecoration(new SpaceItemDecoration(SizeUtils.dp2px(10)));
        mRecyclerView.setLayoutManager(manager);
        mRecyclerView.setAdapter(mAdapter);
        mRefreshLayout.setOnRefreshListener(new OnRefreshListener() {
            @Override
            public void onRefresh(RefreshLayout refreshlayout) {
                getGameData(0);
            }
        });
        mRefreshLayout.setOnLoadmoreListener(new OnLoadmoreListener() {
            @Override
            public void onLoadmore(RefreshLayout refreshlayout) {
                getGameData(mListData.size());
            }
        });
        notDataView = getLayoutInflater().inflate(R.layout.empty_view, (ViewGroup) mRecyclerView.getParent(), false);

    }

    private void getGameData(final int limit_begin) {
        Map<String, String> params = new HashMap<>();
        params.put("token", mToken);
        params.put("limit_begin", String.valueOf(limit_begin));
        params.put("limit_num", 10 + "");
        Api.getMessage(this, params, new OnRequestDataListener() {
            @Override
            public void requestSuccess(int code, JSONObject data) {
                if (limit_begin == 0) {
                    mListData.clear();
                }
                if (mRefreshLayout.isRefreshing()) {
                    mRefreshLayout.finishRefresh();
                }
                if (mRefreshLayout.isLoading()) {
                    mRefreshLayout.finishLoadmore();
                }
                NoticeMessageBean noticeMessageBean = JSON.parseObject(data.toString(), NoticeMessageBean.class);
                mListData.addAll(noticeMessageBean.getInfo());
                mAdapter.setNewData(mListData);
            }

            @Override
            public void requestFailure(int code, String msg) {
                //toast(msg);
                if(mListData.size()==0){
                    mAdapter.setEmptyView(notDataView);
                }
                if (mRefreshLayout.isRefreshing()) {
                    mRefreshLayout.finishRefresh();
                }
                if (mRefreshLayout.isLoading()) {
                    mRefreshLayout.finishLoadmore();
                }
            }
        });
    }

    public void goBack(View v) {
        finish();
    }

    @Override
    public int getLayoutResource() {
        return R.layout.activity_message_list;
    }
}
