
\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Meditation"
composer = #"Tom Jobim"
meter = #"(Med. Bossa)"
kwtempo = #"Medium"
kwstyle = #"Bossa"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Tom Jobim" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=HGLUgbxlsYA"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  c1:6 s b:7sus4 b:7
  c:6 s e:m7 a:7.13- 
  d:m7 s f:m6 \parenthesize bes:7
  e:m7 a:7.13- d:m7 g:5+7

  f:7+ s f:m6 \parenthesize bes:7
  e:m7 es:dim7 d:m7 g:5+7
  \mark \markup \with-color #(x11-color 'red) \bold \larger \musicglyph #"scripts.varcoda"
    bes2:7 a:9- as:7 g:9- c1:6 \startParenthesis \parenthesize d2:m7 \endParenthesis \parenthesize g:7

}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \showStartRepeatBar \bar "[|:" \mark #1
  \repeat volta 2 { 
    a1~ | 2. g4 | \tuplet 3/2 { b4 bes a~ } a2~ | a \tuplet 3/2 { r4 fis g } \break
    a4. 8 \tuplet 3/2 { 4 4 4~ } | \tuplet 3/2 { 2 g4 } r g | \tuplet 3/2 { b4 bes a~ } a2~ | 2. r4 \break
    f1~ | 2. e4 | \tuplet 3/2 { g ges f~ } f2~ | 2 \tuplet 3/2 { r4 c d } \break
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \mark \markup  \with-color #(x11-color 'red) "To Coda"
    e4. 8 \tuplet 3/2 { 4 dis e } | f2~ \tuplet 3/2 { 4 e f } | 
    g4. 8 \tuplet 3/2 { 4 fis g } | a2. r4 \break
  }
  \mark #2 c1~ | 2. b4 | \tuplet 3/2 { d des c~ } 2~ | 2. b4 \break
  \tuplet 3/2 { d des c~ } c b | \tuplet 3/2 { d des c~ } c b | 
  \tuplet 3/2 { a as g~ } 2~ | 1 \bar ":|]"  \break
  e4. f8~ 4. d8~ | 4. e8~ 4. c8~ | 1 | R \bar ".."
  
  }

  chordsRhythm = \relative c''' {
    \override Rest #'staff-position = #7
    \improvisationOn \override NoteHead.no-ledgers = ##t 
  }

  Basse = \relative c {
    \override Rest #'staff-position = #0
    \clef "bass" \key f \major \time 4/4
  }

  grille = \chordmode {
    \bar "[|:" \repeat unfold 2 c1:6 b:7sus4 b:7 \break
    \repeat unfold 2 c1:6 e:m7 a:7.13- \break
    \repeat unfold 2 d:m7 f:m6 bes:7 \break
    e:m7 a:7.13- d:m7 g:5+7 \bar ":|]" \break
    \repeat unfold 2 f:7+ f:m6 bes:7 \break
     e:m7 es:dim7 d:m7 g:5+7 \break \bar ":|]"
     \/bes2:7 a:9- \/as:7 g:9- c1:6 \/d2:m7 g:7
    \bar ".." }

  marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #5 A s1*10
  \once \override TextScript #'extra-offset = #'( 20 . 0 )
  s1 ^\markup \with-color #(x11-color 'red) \bold \fontsize #5 "To Coda"   
  s1 ^\markup \bold \box \fontsize #5 B s1*11
  s1 ^\markup \with-color #(x11-color 'red) \bold \fontsize #5 \musicglyph #"scripts.varcoda" 

  }


  \book {
    \paper {
      #(set-paper-size "tablette")
      page-count = #1
    }
    #(define output-suffix "CTab")
    %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
    \bookpart {
      \score {
        <<
          \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleSol } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \theNotes
          >> 
        >>
      } %\form
  } }

  \book {
    \paper {
      #(set-paper-size "tablette")
      page-count = #1
    }
    #(define output-suffix "BbTab") 
    %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
    \bookpart {
      \score {
        <<
          \new ChordNames { \transpose c d \harmonies } 
          \new Staff \with { instrumentName = \Bb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }  
            \transpose c d \theNotes
          >> 
        >>
      } %\form
  } }

  \book {
    \paper {
      #(set-paper-size "tablette")
      page-count = #1
    }
    #(define output-suffix "EbTab")
    %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
    \bookpart {
      \score {
        <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \with { instrumentName = \Eb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }  
            \transpose c a \theNotes
          >> 
        >>
      } %\form
  } }

  \book {
    \paper {
      #(set-paper-size "a4")
      page-count = #1
    }
    #(define output-suffix "Ca4")
    \bookpart {
      \score {
        <<
          \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleSol } 
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \theNotes
          >> 
        >>
      } %\form
      }  \bookpart {
      \score {
        \layout {
          indent = 0
          ragged-right = ##f
          ragged-last = ##f
          \context {
            \Score
            \remove "Volta_engraver"
            \omit Clef % Cacher la clef
            \omit TimeSignature % cacher la métrique
            \omit BarNumber             
            \override SpacingSpanner.strict-note-spacing = ##t
            proportionalNotationDuration = #(ly:make-moment 1/16)
          }
        }
        <<
          \new Staff \with {
            \remove "Staff_symbol_engraver"
          }    
          \marques
          \new ChordNames \with {
            \override ChordName.extra-offset = #'(10 . -1 )         
            \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
            \override BarLine.bar-extent = #'(-5 . 5)
            \consists "Bar_engraver"
            \override StaffSymbol.line-positions = #'( -10 10 ) 
            \consists "Staff_symbol_engraver"
            \consists "Percent_repeat_engraver"
            \consists "Volta_engraver"
          }
          \grille
        >>
  } } }

  \book {
    \paper {
      #(set-paper-size "a4")
      page-count = #1
    }
    #(define output-suffix "Bba4") 
    \bookpart {
      \score {
        <<
          \new ChordNames { \transpose c d \harmonies } 
          \new Staff \with { instrumentName = \Bb  } <<
            % \new Voice \with { \consists "Pitch_squash_engraver" }  
            \transpose c d \theNotes
          >> 
        >>
      } %\form
      }  \bookpart {
      \score {
        \layout {
          indent = 0
          ragged-right = ##f
          ragged-last = ##f
          \context {
            \Score
            \remove "Volta_engraver"
            \omit Clef % Cacher la clef
            \omit TimeSignature % cacher la métrique
            \omit BarNumber             
            \override SpacingSpanner.strict-note-spacing = ##t
            proportionalNotationDuration = #(ly:make-moment 1/16)
          }
        }
        <<
          \new Staff \with {
            \remove "Staff_symbol_engraver"
          }    
          \marques
          \new ChordNames \with {
            \override ChordName.extra-offset = #'(10 . -1 )         
            \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
            \override BarLine.bar-extent = #'(-5 . 5)
            \consists "Bar_engraver"
            \override StaffSymbol.line-positions = #'( -10 10 ) 
            \consists "Staff_symbol_engraver"
            \consists "Percent_repeat_engraver"
            \consists "Volta_engraver"
          }
          \transpose c d \grille
        >>
  } } }

  \book {
    \paper {
      #(set-paper-size "a4")
      page-count = #1
    }
    #(define output-suffix "Eba4")
    \bookpart {
      \score {
        <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \with { instrumentName = \Eb } <<
            %\new Voice  
            \transpose c a \theNotes
          >> 
        >>
      } %\form
      }  \bookpart {
      \score {
        \layout {
          indent = 0
          ragged-right = ##f
          ragged-last = ##f
          \context {
            \Score
            \remove "Volta_engraver"
            \omit Clef % Cacher la clef
            \omit TimeSignature % cacher la métrique
            \omit BarNumber             
            \override SpacingSpanner.strict-note-spacing = ##t
            proportionalNotationDuration = #(ly:make-moment 1/16)
          }
        }
        <<
          \new Staff \with {
            \remove "Staff_symbol_engraver"
          }    
          \marques
          \new ChordNames \with {
            \override ChordName.extra-offset = #'(10 . -1 )         
            \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
            \override BarLine.bar-extent = #'(-5 . 5)
            \consists "Bar_engraver"
            \override StaffSymbol.line-positions = #'( -10 10 ) 
            \consists "Staff_symbol_engraver"
            \consists "Percent_repeat_engraver"
            \consists "Volta_engraver"
          }
          \transpose c a \grille
        >>
  } } }

