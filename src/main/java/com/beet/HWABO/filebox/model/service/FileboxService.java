package com.beet.HWABO.filebox.model.service;

import java.util.ArrayList;

import com.beet.HWABO.filebox.model.vo.Filebox;

public interface FileboxService {

	ArrayList<Filebox> selectList(String pnum);

	ArrayList<Filebox> selectTxtList(String pnum);

	ArrayList<Filebox> selectZipList(String pnum);

	ArrayList<Filebox> selectEtcList(String pnum);

	ArrayList<Filebox> selectPptList(String pnum);
}
