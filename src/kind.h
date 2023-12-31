#ifndef KIND_H
#define KIND_H

#include <sstream>
#include <string>

namespace alfc {

/**
 */
enum class Kind
{
  NONE = 0,
  
  // types
  TYPE,
  FUNCTION_TYPE,
  PROOF_TYPE,
  ABSTRACT_TYPE,
  BOOL_TYPE,
  QUOTE_TYPE,
  
  // terms
  APPLY,
  LAMBDA,
  TUPLE,
  NIL,
  PROGRAM,
  COLLECT,

  // symbols
  PARAM,
  CONST,
  PROGRAM_CONST,
  PROOF_RULE,
  VARIABLE,
  ORACLE,

  // literals
  BOOLEAN,
  NUMERAL,
  DECIMAL,
  RATIONAL,
  HEXADECIMAL,
  BINARY,
  STRING,

  // operations on literals
  // core
  EVAL_IS_EQ,
  EVAL_IF_THEN_ELSE,
  EVAL_REQUIRES,
  EVAL_HASH,
  // lists
  EVAL_TO_LIST,
  EVAL_FROM_LIST,
  EVAL_CONS,
  // boolean
  EVAL_NOT,
  EVAL_AND,
  EVAL_OR,
  EVAL_XOR,
  // arithmetic
  EVAL_ADD,
  EVAL_NEG,
  EVAL_MUL,
  EVAL_INT_DIV,
  EVAL_INT_MOD,
  EVAL_RAT_DIV,
  EVAL_IS_NEG,
  // strings
  EVAL_LENGTH,
  EVAL_CONCAT,
  EVAL_EXTRACT,
  EVAL_FIND,
  // conversions
  EVAL_TO_INT,
  EVAL_TO_RAT,
  EVAL_TO_BV,
  EVAL_TO_STRING
};

/** Print a kind to the stream, for debugging */
std::ostream& operator<<(std::ostream& o, Kind k);

std::string kindToTerm(Kind k);

/** */
bool isSymbol(Kind k);
/** */
bool isLiteral(Kind k);
/** */
bool isLiteralOp(Kind k);

}  // namespace alfc

#endif /* KIND_H */
