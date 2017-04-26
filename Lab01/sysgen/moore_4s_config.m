
function moore_4s_config(this_block)

  % Revision History:
  %
  %   26-Apr-2017  (18:57 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /home/netolo/DC/P01/PARTA/vhdl_files/moore_4s.vhd
  %
  %

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('moore_4s');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('rst_i');
  this_block.addSimulinkInport('data_i');

  this_block.addSimulinkOutport('data_o');

  data_o_port = this_block.port('data_o');
  data_o_port.setType('UFix_2_0');

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('rst_i').width ~= 1);
      this_block.setError('Input data type for port "rst_i" must have width=1.');
    end

    this_block.port('rst_i').useHDLVector(false);

    if (this_block.port('data_i').width ~= 1);
      this_block.setError('Input data type for port "data_i" must have width=1.');
    end

    this_block.port('data_i').useHDLVector(false);

  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk_i','ce_i')
   end  % if(inputRatesKnown)
  % -----------------------------

    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('../vhdl_files/moore_4s.vhd');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------

