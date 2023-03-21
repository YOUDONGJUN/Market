package com.bit.mybatis.board;

import com.bit.board.dto.QnaReplyDTO;

import java.util.List;

public interface ReplyMapper {

    public List<QnaReplyDTO> readReply(int bno);

    public int reply(QnaReplyDTO dto);

}
