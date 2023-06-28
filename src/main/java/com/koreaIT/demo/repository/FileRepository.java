package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.FileVO;

@Mapper
public interface FileRepository {

	@Insert("""
			INSERT INTO file
				SET regDate = NOW(),
					originName = #{orgName},
					savedName = #{savedName},
					savedPath = #{savedPath},
					relTypeCode = #{relTypeCode},
					relId = (SELECT MAX(EA.id) FROM event_Article EA WHERE EA.memberId = #{loginedMemberId})
			""")
	void insertFileInfo(String orgName, String savedName, String savedPath, String relTypeCode, int loginedMemberId);

	@Delete("""
			DELETE FROM file
				WHERE relTypeCode = #{relTypeCode}
				AND relId = (SELECT MAX(EA.id) FROM event_Article EA WHERE EA.memberId = #{loginedMemberId})
			""")
	void deleteFileInfo( String relTypeCode, int loginedMemberId);
	
	@Select("""
			SELECT *
				FROM file
				WHERE id = #{fileId}
			""")
	FileVO getFileById(int fileId);
	
	
	@Select("""
			SELECT *
				FROM file
				WHERE relId = #{relId}
			""")
	FileVO getFileByRelId(int relId);

	@Select("""
			SELECT *
				FROM file
			""")
	List<FileVO> getFiles();

}