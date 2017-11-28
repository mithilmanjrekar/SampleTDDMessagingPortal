class ConversationsController < ApplicationController

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new 
    @conversation = Conversation.new.save
  end

  # GET /conversations/1/edit
  def edit
  end

  def get_all_conversations_by_user
    reponse_status = 200

    ActiveRecord::Base.transaction do
      @conversations = Conversation.where(:sender_id => params[:id]).all
    end

    if !@conversations.nil? && !@conversations.blank? && @conversations.count > 0
      response_message = "Successfully fetched conversations for user.!" 
    else  
      response_message = "No conversations found for the user!"
    end  

    respond_to do |format|
        msg = { :status => reponse_status, :message => response_message, :conversations => @conversations }
        format.json  { render :json => msg } 
    end

  end

  # def get_conversation
  #   reponse_status = 200 
  #   response_message = "No conversations found."
  #   conversation_array = Array.new
    
  #   ActiveRecord::Base.transaction do
  #     #Sender id for the logged in user will be picked from session
  #     @conversations = Conversation.where(:sender_id => 1 , :recipient_id => params[:id])
  #     if !@conversations.nil? && !@conversations.blank? 
  #       #Loop around all the conversation and populate 
  #       @conversations.each do |conversation|
  #         if !conversation.nil? && !conversation.blank? && conversation.messages.exists?
  #           active_conversations = Hash.new
  #           active_conversations["conversation"] = conversation
  #           active_conversations["messages"] = conversation.messages
  #           conversation_array.push(active_conversations)
  #         end 
  #       end
  #       response_message =  "Sucessfully fetched conversation with messages."
  #     end
  #   end
    
  #   respond_to do |format|
  #       msg = { :status => reponse_status, :message => response_message, :conversation => conversation_array  }
  #       format.json  { render :json => msg }
  #   end

  # end 

  def get_conversation
  reponse_status = 200 
  response_message = "No conversations found."
  conversations_array = Array.new
  
    ActiveRecord::Base.transaction do
      #Sender id for the logged in user will be picked from session
      @conversations = Conversation.get_conversations(1 ,params[:id])
      if !@conversations.nil? && !@conversations.blank? 
        conversations_array = Conversation.get_populated_coversations_messages(@conversations)
        response_message =  "Sucessfully fetched conversation with messages."
      end
    end

    respond_to do |format|
        msg = { :status => reponse_status, :message => response_message, :conversation => conversations_array  }
        format.json  { render :json => msg }
    end

  end 

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(:sender_id => params[:conversation][:sender_id], :recipient_id => params[:conversation][:recipient_id])

    respond_to do |format|
      if @conversation.save
        
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
