# SPDX-Copyright: Copyright (c) Capital One Services, LLC 
# SPDX-License-Identifier: Apache-2.0 
# Copyright 2017 Capital One Services, LLC 
#
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. 
#
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 
#
# Unless required by applicable law or agreed to in writing, software distributed 
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
# OF ANY KIND, either express or implied.

#' validateArguments
#'
#' @param matchKey A character or character vector of column names to match on
#' @param coerceCols Boolean - do we coerce columns names?
#' @param maxMismatch Cap for number of mismatches 
#' @inheritParams rCompare
#' @return Nothing. Errors if any parameters are invalid.
#' @examples
#' \dontrun{validateArguments('plantName',1E-8,T,1000)}
#' \dontrun{validateArguments('colorName',1E-9,F,10)}
validateArguments <- function(matchKey = NA, roundDigits = NA, coerceCols = TRUE , maxMismatch = NA)
{

  # Check that match key is empty, or is a character, or is a vector of characters
  if(length(matchKey) == 1) {
    if (!is.na(matchKey) & !is.character(matchKey))
    {
      stop("ERROR: Key must be character")
    }
  }
  else if (!is.character(matchKey))
  {
    stop("ERROR: Key must be character")
  }
  

  # Check that roundDigits is numeric or NA
  if (is.numeric(roundDigits) | is.na(roundDigits)) {
  } else {
    stop("ERROR: roundDigits must be an integer or NA ")
  }
  
  # Check that coerceCols is boolean
  if (!is.logical(coerceCols))  {
    stop("ERROR: Coerce flag must be Boolean")
  }
  
  # Check that maxMismatch is numeric, > 0 
  if (is.numeric(maxMismatch) | is.na(maxMismatch)) {
  }
  else {
    stop("ERROR: Mismatch must be numeric or NA")
  }
  
  if (is.numeric(maxMismatch) & maxMismatch <= 0)  {
    stop("ERROR: Mismatch must be greater than 0")
  }
  
  if (is.numeric(maxMismatch) & maxMismatch%%1!=0)  {
    stop("ERROR: Mismatch must be an integer")
  }
  
}