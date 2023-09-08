#ifndef TOKENS_H
#define TOKENS_H

#include <sstream>
#include <string>

namespace alfc {

/**
 */
enum class Token
{
  EOF_TOK = 0,
  ABSTRACT_TYPE,
  ASSERT,
  ASSUME,
  ASSUME_PUSH,
  ATTRIBUTE,
  BOOL_TYPE,
  BINARY_LITERAL,
  CHECK_SAT,
  CHECK_SAT_ASSUMING,
  DECIMAL_LITERAL,
  DECLARE_AXIOM,
  DECLARE_CODATATYPE,
  DECLARE_CODATATYPES,
  DECLARE_CONST,
  DECLARE_CONSTS,
  DECLARE_DATATYPE,
  DECLARE_DATATYPES,
  DECLARE_FUN,
  DECLARE_ORACLE_FUN,
  DECLARE_RULE,
  DECLARE_SORT,
  DECLARE_TYPE,
  DECLARE_VAR,
  DEFINE,
  DEFINE_CONST,
  DEFINE_FUN,
  DEFINE_SORT,
  DEFINE_TYPE,
  ECHO,
  EXIT,
  HEX_LITERAL,
  INCLUDE,
  INTEGER_LITERAL,
  KEYWORD,
  MATCH,
  LET,
  LPAREN,
  NUMERAL,
  PAR,
  PROGRAM,
  PROOF,
  PROOF_TYPE,
  QUOTED_SYMBOL,
  REFERENCE,
  RESET,
  RPAREN,
  SET_INFO,
  SET_LOGIC,
  SET_OPTION,
  STEP,
  STEP_POP,
  STRING_LITERAL,
  SYMBOL,
  TYPE,
  UNTERMINATED_QUOTED_SYMBOL,
  UNTERMINATED_STRING_LITERAL,
  NONE
};

/** Print a token to the stream, for debugging */
std::ostream& operator<<(std::ostream& o, Token t);

}  // namespace alfc

#endif /* TOKENS_H */
